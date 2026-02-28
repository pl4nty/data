local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
L3_1 = L1_1.ppid
if L3_1 == nil or L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "AmsiScanBuffer"
L6_1 = "AmsiScanString"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = pairs
L11_1 = L4_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = bm
  L15_1 = L15_1.GetProcAddress
  L16_1 = L3_1
  L17_1 = "amsi.dll"
  L18_1 = L14_1
  L15_1 = L15_1(L16_1, L17_1, L18_1)
  L5_1 = L15_1
  if L5_1 == nil then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  L15_1 = bm
  L15_1 = L15_1.ReadProcMem
  L16_1 = L5_1
  L17_1 = 256
  L18_1 = L3_1
  L15_1 = L15_1(L16_1, L17_1, L18_1)
  L6_1 = L15_1
  if L6_1 == nil then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  L15_1 = tohex
  L16_1 = L6_1
  L15_1 = L15_1(L16_1)
  L7_1 = L15_1
  if 4294967295 < L5_1 then
    L15_1 = mp
    L8_1 = L15_1.SMS_PROC_ARCH_X64
  else
    L15_1 = mp
    L8_1 = L15_1.SMS_PROC_ARCH_X32
  end
  L15_1 = mp
  L15_1 = L15_1.x86dasm
  L16_1 = L8_1
  L17_1 = L5_1
  L18_1 = L6_1
  L19_1 = 256
  L20_1 = 50
  L21_1 = L5_1
  L22_1 = mp
  L22_1 = L22_1.DASM_LINEAR_FLOW
  L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  L9_1 = L15_1
  if L9_1 == nil then
    L15_1 = mp
    L15_1 = L15_1.CLEAN
    return L15_1
  end
  L15_1 = pairs
  L16_1 = L9_1
  L15_1, L16_1, L17_1 = L15_1(L16_1)
  for L18_1, L19_1 in L15_1, L16_1, L17_1 do
    L20_1 = L19_1.opcode
    if L20_1 ~= 195 then
      L20_1 = L19_1.opcode
      if L20_1 ~= 194 then
        goto lbl_177
      end
    end
    if L18_1 < 10 then
      L20_1 = string
      L20_1 = L20_1.format
      L21_1 = "Function %s at 0x%02x, cpu is %d"
      L22_1 = L14_1
      L23_1 = L5_1
      L24_1 = L8_1
      L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
      L21_1 = bm
      L21_1 = L21_1.add_related_string
      L22_1 = "AMSI PATCH TARGET: "
      L23_1 = L0_1
      L24_1 = bm
      L24_1 = L24_1.RelatedStringBMReport
      L21_1(L22_1, L23_1, L24_1)
      L21_1 = bm
      L21_1 = L21_1.add_related_string
      L22_1 = "AMSI PATCH BYTES: "
      L23_1 = L7_1
      L24_1 = bm
      L24_1 = L24_1.RelatedStringBMReport
      L21_1(L22_1, L23_1, L24_1)
      L21_1 = bm
      L21_1 = L21_1.add_related_string
      L22_1 = "AMSI PATCH Commandline: "
      L23_1 = L2_1
      L24_1 = bm
      L24_1 = L24_1.RelatedStringBMReport
      L21_1(L22_1, L23_1, L24_1)
      L21_1 = bm
      L21_1 = L21_1.add_related_string
      L22_1 = "AMSI: "
      L23_1 = L20_1
      L24_1 = bm
      L24_1 = L24_1.RelatedStringBMReport
      L21_1(L22_1, L23_1, L24_1)
      L21_1 = TrackPidAndTechnique
      L22_1 = "BM"
      L23_1 = "T1562.006"
      L24_1 = "AMSIPatch"
      L21_1(L22_1, L23_1, L24_1)
      L21_1 = bm
      L21_1 = L21_1.request_SMS
      L22_1 = L3_1
      L23_1 = "h+"
      L21_1(L22_1, L23_1)
      L21_1 = bm
      L21_1 = L21_1.trigger_sig
      L22_1 = "ReflectiveLoading"
      L23_1 = "AMSI_Patched"
      L21_1(L22_1, L23_1)
      L21_1 = mp
      L21_1 = L21_1.INFECTED
      return L21_1
    end
    do break end
    goto lbl_181
    ::lbl_177::
    L20_1 = L19_1.jtype
    if L20_1 ~= 0 then
      break
    end
    ::lbl_181::
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
