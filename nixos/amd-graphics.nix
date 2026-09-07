{ config, pkgs, ... }:

{
  # --- Graphics: AMD GPU (amdgpu + ROCm-friendly OpenCL/Vulkan) ---
  # Shared with the desktop, but the ROCm/HSA bits below exist specifically
  # for local AI inference (llama.cpp, Ollama, ComfyUI, etc.) on this card.
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Steam/Proton and 32-bit apps
  };

  hardware.amdgpu.opencl.enable = true;

  # RDNA2 (gfx1031/gfx1030) isn't always in ROCm's officially supported
  # target list — this overrides the reported GFX version so ROCm treats
  # the card as gfx1030, which is supported. Required for llama.cpp/ROCm
  # to initialize without a memory-allocation error on this GPU.
  environment.variables.HSA_OVERRIDE_GFX_VERSION = "10.3.0";

  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    rocmPackages.rocminfo
    rocmPackages.rocm-smi
    rocmPackages.clr
    rocmPackages.clr.icd
    pkgsRocm.llama-cpp
    libvdpau-va-gl
    libva-vdpau-driver
  ];
}

