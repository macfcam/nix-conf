{ stdenv, lib, fetchurl, buildFHSEnv, autoPatchelfHook,
  coreutils, nss, gtk3, webkitgtk_4_0, libappindicator, ... }:

let
  netskope-client-unwrapped = stdenv.mkDerivation {
    pname = "netskope-client-unwrapped";
    version = "130.1.2.2489";

    src = fetchurl {
      url = "https://download-lojasrenner.eu.goskope.com/dlr/linux/get";
      sha256 = "sha256-Zc2m6J1ptYfYdbVfG588WJnaf/vowKy36VKfs2lzq7s=";
    };

    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [ coreutils gtk3 libappindicator nss stdenv.cc.cc.lib webkitgtk_4_0 ];

    phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

    unpackPhase = ''
      mkdir contents
      tail -n +436 $src | gzip -cd | tar xf - -C contents
    '';

    installPhase = ''
      runHook preInstall
      appPath=$out/opt/netskope/stagent
      mkdir -p $appPath/{data,scripts,resources/idpServiceProviderPages}

      install -Dm755 contents/certutil -t $appPath
      install -Dm755 contents/nsdiag -t $appPath
      install -Dm755 contents/stAgent* -t $appPath

      install -Dm755 contents/gpgverify.sh -t $appPath/scripts
      install -Dm755 contents/stagentd_pre_exec.sh -t $appPath/scripts
      install -Dm644 contents/*.service -t $appPath/scripts
      install -Dm644 contents/*.desktop -t $appPath/scripts

      cp -f contents/resources/* $appPath/resources || true
      cp -rf contents/resources/idpServiceProviderPages/* \
        $appPath/resources/idpServiceProviderPages || true

      runHook postInstall
    '';
  };

  nswrapper = buildFHSEnv {
    name = "netskope";
    targetPkgs = pkgs: with pkgs; [
      coreutils gtk3 libappindicator nss stdenv.cc.cc.lib webkitgtk_4_0
      netskope-client-unwrapped
    ];

    extraInstallCommands = ''
      appPath=${netskope-client-unwrapped}/opt/netskope/stagent
      wrapper="$out/bin/nswrapper"

      install -Dm444 $appPath/scripts/stagentapp.service -t $out/lib/systemd/user
      install -Dm444 $appPath/scripts/stagentd.service -t $out/lib/systemd/system
      install -Dm444 $appPath/scripts/stagentui.desktop -t $out/share/applications

      substituteInPlace $out/lib/systemd/user/stagentapp.service \
        --replace /opt/netskope/stagent/stAgentApp "$wrapper -e stAgentApp" \
        --replace /opt/netskope/stagent $appPath

      substituteInPlace $out/lib/systemd/system/stagentd.service \
        --replace /opt/netskope/stagent/stAgentSvc "$wrapper -e stAgentSvc" \
        --replace /opt/netskope/stagent $appPath

      substituteInPlace $out/share/applications/stagentui.desktop \
        --replace /opt/netskope/stagent/stAgentUI "$wrapper -e stAgentUI" \
        --replace /opt/netskope/stagent $appPath
    '';
  };
in
nswrapper
