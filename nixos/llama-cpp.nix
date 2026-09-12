{
  config,
  pkgs,
  lib,
  ...
}: let
  llama-cpp-rocm = pkgs.llama-cpp.override {rocmSupport = true;};
  llama-server = lib.getExe' llama-cpp-rocm "llama-server";
in {
  services.llama-swap = {
    enable = true;
    settings = {
      healthCheckTimeout = 60;

      models = {
        "qwen2.5-7b" = {
          cmd = ''
            ${llama-server} --port ''${PORT} \
              -hf-repo Qwen/Qwen2.5-Coder-7B-Instruct-GGUF \
              -hf-file qwen2.5-coder-7b-instruct-q5_k_m.gguf \
              -ngl 999 -c 8192 --host 0.0.0.0 --no-webui
          '';
          ttl = 300;
        };
      };
    };
  };
}
