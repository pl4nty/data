local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = IsKeyInRollingQueue
L1_1 = "ETWPatch"
L2_1 = "FunctionPatched"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[1]
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[2]
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
L6_1 = "NtTraceEvent"
L7_1 = "EtwEventWrite"
L8_1 = "EtwEventWriteEx"
L9_1 = "EtwEventWriteTransfer"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = bm
L11_1 = L11_1.GetPEBInfo
L12_1 = L4_1
L11_1 = L11_1(L12_1)
L12_1 = isnull
L13_1 = L11_1
L12_1 = L12_1(L13_1)
if L12_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = L11_1.ProcArch
L13_1 = mp
L13_1 = L13_1.SMS_PROC_ARCH_X64
if L12_1 == L13_1 then
  L12_1 = mp
  L9_1 = L12_1.SMS_PROC_ARCH_X64
else
  L12_1 = L11_1.ProcArch
  L13_1 = mp
  L13_1 = L13_1.SMS_PROC_ARCH_X32
  if L12_1 == L13_1 then
    L12_1 = mp
    L9_1 = L12_1.SMS_PROC_ARCH_X32
  else
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
end
L12_1 = pairs
L13_1 = L5_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = bm
  L17_1 = L17_1.GetProcAddress
  L18_1 = L4_1
  L19_1 = "ntdll.dll"
  L20_1 = L16_1
  L17_1 = L17_1(L18_1, L19_1, L20_1)
  L6_1 = L17_1
  if L6_1 == nil then
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
  L17_1 = bm
  L17_1 = L17_1.ReadProcMem
  L18_1 = L6_1
  L19_1 = 256
  L20_1 = L4_1
  L17_1 = L17_1(L18_1, L19_1, L20_1)
  L7_1 = L17_1
  if L7_1 == nil then
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
  L17_1 = tohex
  L18_1 = L7_1
  L17_1 = L17_1(L18_1)
  L8_1 = L17_1
  L17_1 = mp
  L17_1 = L17_1.SMS_PROC_ARCH_X64
  if L9_1 == L17_1 and L6_1 < 123145302310912 then
    L17_1 = mp
    L17_1 = L17_1.readu_u32
    L18_1 = L7_1
    L19_1 = 1
    L17_1 = L17_1(L18_1, L19_1)
    L18_1 = mp
    L18_1 = L18_1.readu_u16
    L19_1 = L7_1
    L20_1 = 5
    L18_1 = L18_1(L19_1, L20_1)
    L19_1 = mp
    L19_1 = L19_1.bitand
    L20_1 = L18_1
    L21_1 = 255
    L19_1 = L19_1(L20_1, L21_1)
    L18_1 = L19_1
    if L17_1 == 149717832 and L18_1 == 199 then
      L19_1 = mp
      L19_1 = L19_1.CLEAN
      return L19_1
    end
  end
  L17_1 = mp
  L17_1 = L17_1.x86dasm
  L18_1 = L9_1
  L19_1 = L6_1
  L20_1 = L7_1
  L21_1 = 256
  L22_1 = 50
  L23_1 = L6_1
  L24_1 = mp
  L24_1 = L24_1.DASM_LINEAR_FLOW
  L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
  L10_1 = L17_1
  if L10_1 == nil then
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
  L17_1 = pairs
  L18_1 = L10_1
  L17_1, L18_1, L19_1 = L17_1(L18_1)
  for L20_1, L21_1 in L17_1, L18_1, L19_1 do
    L22_1 = L21_1.opcode
    if L22_1 ~= 195 then
      L22_1 = L21_1.opcode
      if L22_1 ~= 194 then
        goto lbl_226
      end
    end
    if L20_1 < 10 then
      L22_1 = string
      L22_1 = L22_1.format
      L23_1 = "Function %s at 0x%02x, cpu is %d"
      L24_1 = L16_1
      L25_1 = L6_1
      L26_1 = L9_1
      L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
      L23_1 = bm
      L23_1 = L23_1.add_related_string
      L24_1 = "ETW PATCH TARGET: "
      L25_1 = L1_1
      L26_1 = bm
      L26_1 = L26_1.RelatedStringBMReport
      L23_1(L24_1, L25_1, L26_1)
      L23_1 = bm
      L23_1 = L23_1.add_related_string
      L24_1 = "ETW PATCH BYTES: "
      L25_1 = L8_1
      L26_1 = bm
      L26_1 = L26_1.RelatedStringBMReport
      L23_1(L24_1, L25_1, L26_1)
      L23_1 = bm
      L23_1 = L23_1.add_related_string
      L24_1 = "ETW NTDLL: "
      L25_1 = L22_1
      L26_1 = bm
      L26_1 = L26_1.RelatedStringBMReport
      L23_1(L24_1, L25_1, L26_1)
      L23_1 = TrackPidAndTechnique
      L24_1 = "BM"
      L25_1 = "T1562.006"
      L26_1 = "ETWPatch"
      L23_1(L24_1, L25_1, L26_1)
      L23_1 = bm
      L23_1 = L23_1.add_related_process
      L24_1 = L4_1
      L23_1(L24_1)
      L23_1 = AppendToRollingQueue
      L24_1 = "ETWPatch"
      L25_1 = "FunctionPatched"
      L26_1 = L6_1
      L27_1 = 86400
      L23_1(L24_1, L25_1, L26_1, L27_1)
      L23_1 = mp
      L23_1 = L23_1.INFECTED
      return L23_1
    end
    do break end
    goto lbl_230
    ::lbl_226::
    L22_1 = L21_1.jtype
    if L22_1 ~= 0 then
      break
    end
    ::lbl_230::
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
