{ lib, config, ... }: with lib; let cfg = config.nix; in {

	options.nix.autoOptimiseStore = mkOption {
		type = types.bool;
		default = false;
		description = ''
			Darwin patch to add `auto-optimise-store`
		'';
	};

	config.nix.structuredExtraOptions.auto-optimise-store = cfg.autoOptimiseStore;
}