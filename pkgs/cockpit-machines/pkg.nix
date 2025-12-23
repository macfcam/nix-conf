{
  lib,
  stdenv,
  fetchzip,
  gettext,
}:

stdenv.mkDerivation rec {
  pname = "cockpit-machines";
  version = "346";

  src = fetchzip {
    url = "https://github.com/cockpit-project/cockpit-machines/releases/download/${version}/cockpit-machines-${version}.tar.xz";
    sha256 = "sha256-Hc3M4JB+RHzABIKRQtvD4SyErh4CbY2ZV69lLerZDvw=";
  };

  nativeBuildInputs = [
    gettext
  ];

  makeFlags = [
    "DESTDIR=$(out)"
    "PREFIX="
  ];

  postPatch = ''
    substituteInPlace Makefile \
      --replace-warn /usr/share $out/share

    # Work around Makefile generating these via git (tarball has no .git directory)
    touch pkg/lib/cockpit.js
    touch pkg/lib/cockpit-po-plugin.js

    # NixOS: patch the manifest condition to use the NixOS dbus policy path
    # instead of /usr/share/... (which doesn't exist on NixOS)
    substituteInPlace dist/manifest.json \
      --replace-fail '"/usr/share/dbus-1/system.d/org.libvirt.conf"' \
                     '"/run/current-system/sw/share/dbus-1/system.d/org.libvirt.conf"'

    substituteInPlace src/manifest.json \
      --replace-fail '"/usr/share/dbus-1/system.d/org.libvirt.conf"' \
                     '"/run/current-system/sw/share/dbus-1/system.d/org.libvirt.conf"'

    # Touch dist/manifest.json so Make considers it up-to-date and won't try to rebuild it
    touch dist/manifest.json
  '';

  postFixup = ''
    gunzip $out/share/cockpit/machines/index.js.gz
    sed -i "s#/usr/bin/python3#/usr/bin/env python3#ig" $out/share/cockpit/machines/index.js
    sed -i "s#/usr/bin/pwscore#/usr/bin/env pwscore#ig" $out/share/cockpit/machines/index.js
    gzip -9 $out/share/cockpit/machines/index.js
  '';

  dontBuild = true;

  meta = with lib; {
    description = "Cockpit UI for virtual machines";
    license = licenses.lgpl21;
    homepage = "https://github.com/cockpit-project/cockpit-machines";
    platforms = platforms.linux;
    maintainers = with maintainers; [ ];
  };
}
