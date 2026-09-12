{pkgs, ...}: {
  services.llama-cpp.instances.default = {
    enable = true;
    package = pkgs.llama-cpp.override {rocmSupport = true;};
    hfRepo = "Qwen/Qwen2.5-Coder-7B-Instruct-GGUF";
    hfFile = "qwen2.5-coder-7b-instruct-q5_k_m.gguf";
    settings = {
      host = "127.0.0.1";
      port = 8080;
      ngl = 99; # Push processing entirely to your 6700 XT
      ctx-size = 8192; # Give the agent enough room to read code files
    };
  };
}
