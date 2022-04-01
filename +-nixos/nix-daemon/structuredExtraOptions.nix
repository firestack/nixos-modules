{ lib, config, ... }: with lib; {

	options.nix.structuredExtraOptions = mkOption {
		type = types.attrs;
		default = {};
		description = ''
			a nix interface to some `nix.extraOptions`
		'';
	};

	#### Implementation ####
	config.nix.extraOptions = let
		cfg = config.nix;

		toRepr = value:
			if lib.types.bool.check value
				then lib.trivial.boolToString value
				else builtins.toString value;

		buildLinesConfig = attrs:
			lib.concatStringsSep "\n" (
				lib.attrsets.mapAttrsToList
					(k: v: "${k} = ${toRepr v}")
					attrs
			);
	in "\n## Structured 'Extra Options'\n"
		+ buildLinesConfig cfg.structuredExtraOptions;
}
