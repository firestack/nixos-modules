{ lib, config, ... }: with lib; let cfg = config.nix; in {
	imports = [ ./structuredExtraOptions.nix ];

	options.nix.experimentalFeatures = mkOption {
		type = types.listOf types.str;
		default = [];
		description = ''
			Allows setting of `experimental-features` in nix.conf
		'';
	};

	config.nix.structuredExtraOptions = {
		experimental-features =
			lib.concatStringsSep
			" "
			cfg.experimentalFeatures;
	};
}
