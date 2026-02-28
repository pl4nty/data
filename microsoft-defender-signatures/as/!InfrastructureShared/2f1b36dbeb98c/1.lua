local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[4]
end
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[5]
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p1
L3_1 = "imagename:(.+);targetprocessppid:(%d+):"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L2_1 == nil or L1_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pcall
L4_1 = mp
L4_1 = L4_1.GetPPidFromPid
L5_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L4_1 == nil or L3_1 == false then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "AmsiScanBuffer"
L7_1 = "AmsiScanString"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = pairs
L12_1 = L5_1
L11_1, L12_1, L13_1 = L11_1(L12_1)
for L14_1, L15_1 in L11_1, L12_1, L13_1 do
  L16_1 = bm
  L16_1 = L16_1.GetProcAddress
  L17_1 = L4_1
  L18_1 = "amsi.dll"
  L19_1 = L15_1
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  L6_1 = L16_1
  if L6_1 == nil then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = bm
  L16_1 = L16_1.ReadProcMem
  L17_1 = L6_1
  L18_1 = 256
  L19_1 = L4_1
  L16_1 = L16_1(L17_1, L18_1, L19_1)
  L7_1 = L16_1
  if L7_1 == nil then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = tohex
  L17_1 = L7_1
  L16_1 = L16_1(L17_1)
  L8_1 = L16_1
  if 4294967295 < L6_1 then
    L16_1 = mp
    L9_1 = L16_1.SMS_PROC_ARCH_X64
  else
    L16_1 = mp
    L9_1 = L16_1.SMS_PROC_ARCH_X32
  end
  L16_1 = mp
  L16_1 = L16_1.x86dasm
  L17_1 = L9_1
  L18_1 = L6_1
  L19_1 = L7_1
  L20_1 = 256
  L21_1 = 50
  L22_1 = L6_1
  L23_1 = mp
  L23_1 = L23_1.DASM_LINEAR_FLOW
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
  L10_1 = L16_1
  if L10_1 == nil then
    L16_1 = mp
    L16_1 = L16_1.CLEAN
    return L16_1
  end
  L16_1 = pairs
  L17_1 = L10_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = L20_1.opcode
    if L21_1 ~= 195 then
      L21_1 = L20_1.opcode
      if L21_1 ~= 194 then
        goto lbl_154
      end
    end
    if L19_1 < 10 then
      L21_1 = string
      L21_1 = L21_1.format
      L22_1 = "Function %s at 0x%02x, cpu is %d"
      L23_1 = L15_1
      L24_1 = L6_1
      L25_1 = L9_1
      L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
      L22_1 = bm
      L22_1 = L22_1.add_related_string
      L23_1 = "AMSI PATCH TARGET: "
      L24_1 = L1_1
      L25_1 = bm
      L25_1 = L25_1.RelatedStringBMReport
      L22_1(L23_1, L24_1, L25_1)
      L22_1 = bm
      L22_1 = L22_1.add_related_string
      L23_1 = "AMSI PATCH BYTES: "
      L24_1 = L8_1
      L25_1 = bm
      L25_1 = L25_1.RelatedStringBMReport
      L22_1(L23_1, L24_1, L25_1)
      L22_1 = bm
      L22_1 = L22_1.add_related_string
      L23_1 = "AMSI: "
      L24_1 = L21_1
      L25_1 = bm
      L25_1 = L25_1.RelatedStringBMReport
      L22_1(L23_1, L24_1, L25_1)
      L22_1 = TrackPidAndTechnique
      L23_1 = "BM"
      L24_1 = "T1562.006"
      L25_1 = "AMSIPatch"
      L22_1(L23_1, L24_1, L25_1)
      L22_1 = bm
      L22_1 = L22_1.add_related_process
      L23_1 = L4_1
      L22_1(L23_1)
      L22_1 = mp
      L22_1 = L22_1.INFECTED
      return L22_1
    end
    do break end
    goto lbl_158
    ::lbl_154::
    L21_1 = L20_1.jtype
    if L21_1 ~= 0 then
      break
    end
    ::lbl_158::
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
