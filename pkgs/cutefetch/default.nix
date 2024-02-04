{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "cutefetch";
  version = "minimal";

  src = fetchFromGitHub {
    owner = "AlphaTechnolog";
    repo = "cutefetch";
    rev = version;
    hash = "sha256-MgTCaqcg7DCiWrxse7nQM25vsSRQOv5CeSne0OvIkas=";
  };

  meta = with lib; {
    description = "A little fetch utility made with bare c and nice performance";
    homepage = "https://github.com/AlphaTechnolog/cutefetch";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [AlphaTechnolog ];
    mainProgram = "cutefetch";
    platforms = platforms.all;
  };
}


