{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  ({
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "ListLike"; version = "4.7.8"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2007-2008 John Goerzen";
      maintainer = "David Fox <dsf@seereason.com>, Andreas Abel";
      author = "John Goerzen";
      homepage = "http://github.com/ddssff/listlike";
      url = "";
      synopsis = "Generalized support for list-like structures";
      description = "Generalized support for list-like structures in Haskell.\n\nThe ListLike module provides a common interface to the various Haskell\ntypes that are list-like.  Predefined interfaces include standard\nHaskell lists, Arrays, ByteStrings, and lazy ByteStrings.  Custom\ntypes can easily be made ListLike instances as well.\n\nListLike also provides for String-like types, such as String and\nByteString, for types that support input and output, and for types that can handle\ninfinite lists.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."fmlist" or (errorHandler.buildDepError "fmlist"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.4")) (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"));
        buildable = true;
        };
      tests = {
        "listlike-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ListLike" or (errorHandler.buildDepError "ListLike"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."fmlist" or (errorHandler.buildDepError "fmlist"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.4")) (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"));
          buildable = true;
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchurl {
      url = "http://hackage.haskell.org/package/ListLike-4.7.8.tar.gz";
      sha256 = "9a7929f29011e5647b39b8d6ef1cadf76a6ada19b747eabec5fdc077bc7437d1";
      });
    }) // {
    package-description-override = "Name: ListLike\nVersion: 4.7.8\nLicense: BSD3\nMaintainer: David Fox <dsf@seereason.com>, Andreas Abel\nAuthor: John Goerzen\nCopyright: Copyright (c) 2007-2008 John Goerzen\nlicense-file: COPYRIGHT\nCategory: list, string, text, bytestring, vector\nCabal-Version: >= 1.10\nBuild-Type: Simple\nhomepage: http://github.com/ddssff/listlike\nsynopsis: Generalized support for list-like structures\nDescription: Generalized support for list-like structures in Haskell.\n .\n The ListLike module provides a common interface to the various Haskell\n types that are list-like.  Predefined interfaces include standard\n Haskell lists, Arrays, ByteStrings, and lazy ByteStrings.  Custom\n types can easily be made ListLike instances as well.\n .\n ListLike also provides for String-like types, such as String and\n ByteString, for types that support input and output, and for types that can handle\n infinite lists.\nStability: Stable\n\nTested-With:\n  GHC == 9.4.1\n  GHC == 9.2.2\n  GHC == 9.0.2\n  GHC == 8.10.7\n  GHC == 8.8.4\n  GHC == 8.6.5\n  GHC == 8.4.4\n  GHC == 8.2.2\n  GHC == 8.0.2\n  GHC == 7.10.3\n\nextra-source-files:\n  README.md\n  CHANGELOG.md\n\nLibrary\n  default-language: Haskell2010\n  GHC-Options: -Wall\n  Hs-Source-Dirs: src\n  Exposed-Modules: Data.ListLike\n          Data.ListLike.Base\n          Data.ListLike.Chars\n          Data.ListLike.CharString\n          Data.ListLike.FoldableLL\n          Data.ListLike.IO\n          Data.ListLike.Instances\n          Data.ListLike.String\n          Data.ListLike.Text\n          Data.ListLike.Text.Builder\n          Data.ListLike.Text.Text\n          Data.ListLike.Text.TextLazy\n          Data.ListLike.UTF8\n          Data.ListLike.Utils\n          Data.ListLike.Vector\n          Data.ListLike.Vector.Generic\n          Data.ListLike.Vector.Storable\n          Data.ListLike.Vector.Unboxed\n          Data.ListLike.Vector.Vector\n          Data.ListLike.DList\n          Data.ListLike.FMList\n  -- Other-Modules: Data.ConfigFile.Lexer\n  Build-Depends: base       >= 4.8   && < 5\n                ,containers >= 0.3   && < 0.7\n                ,bytestring >= 0.9.1 && < 0.12\n                ,array      >= 0.3   && < 0.6\n                ,text       >= 0.11  && < 1.3  || == 2.0.*\n                ,vector     >= 0.5   && < 0.14\n                ,dlist      >= 0.7   && < 1.1\n                ,fmlist     >= 0.8   && < 0.10\n                ,utf8-string >= 0.3.1 && < 1.1\n                ,deepseq\n\n  -- Remark: Atm, we don't comply with the Haskell Package Versioning Policy\n  --   https://pvp.haskell.org/\n  -- > §6. Client defines orphan instance.\n  -- > If a package defines an orphan instance, it MUST depend on the\n  -- > minor version of the packages that define the data type and the\n  -- > type class to be backwards compatible. For example,\n  -- > build-depends: mypkg >= 2.1.1 && < 2.1.2.\n  --\n  -- Since ListLike defines orphan instances, we would need to include\n  -- the minor version number in the upper bounds.\n  -- (See issues #7 and #10.)\n  -- However, this could involve a maintenance marathon to relax upper bounds.\n\n  If !impl(ghc >= 8.4)\n    Build-Depends: semigroups >= 0.16 && < 0.20\n\n  if impl(ghc >= 8.0)\n    ghc-options:  -Wcompat\n\nTest-suite listlike-tests\n  default-language: Haskell2010\n  Hs-source-dirs: testsrc\n  Main-is:        runtests.hs\n  Type:           exitcode-stdio-1.0\n\n  Other-modules:  TestInfrastructure\n  Build-depends:   base\n                  ,ListLike\n                  ,HUnit      >= 1.2 && < 2\n                  ,QuickCheck >= 2.4 && < 3\n                  ,random     >= 1   && < 2\n                  ,array\n                  ,bytestring\n                  ,containers\n                  ,dlist\n                  ,fmlist\n                  ,text\n                  ,vector\n                  ,utf8-string\n  If !impl(ghc >= 8.4)\n    Build-Depends: semigroups >= 0.16 && < 0.20\n\nsource-repository head\n  type:     git\n  location: git://github.com/ddssff/listlike.git\n";
    }