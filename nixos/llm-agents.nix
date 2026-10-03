{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    omp
    opencode
    # ... other tools
  ];
}
