{ lib, config, ... }: with lib; let cfg = config.homebrew; in {
	options.homebrew.linkEtc = mkOption {
		type = types.bool;
		description = "Link homebrew file into /etc";
		default = false;
	};

	config = mkIf config.homebrew.linkEtc ({
		environment.etc."Brewfile" = { 
			target = "Brewfile";
			source = config.environment.variables.HOMEBREW_BUNDLE_FILE;
		};
	});
}
