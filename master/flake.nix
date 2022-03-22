{
  description = ''getch() for Windows and Unix'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-getch-master.flake = false;
  inputs.src-getch-master.owner = "6A";
  inputs.src-getch-master.ref   = "master";
  inputs.src-getch-master.repo  = "getch";
  inputs.src-getch-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-getch-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-getch-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}