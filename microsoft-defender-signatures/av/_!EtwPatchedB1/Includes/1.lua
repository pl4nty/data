local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = IsKeyInRollingQueue
L1_1 = "Etwpatch"
L2_1 = "Ntdll"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = "NtTraceEvent"
L2_1 = "EtwEventWrite"
L3_1 = "EtwEventWriteEx"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = mp
  L6_1 = L6_1.GetProcAddress
  L7_1 = "ntdll.dll"
  L8_1 = L5_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = mp
  L7_1 = L7_1.ReadProcMem
  L8_1 = L6_1
  L9_1 = 32
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.readu_u16
    L9_1 = L7_1
    L10_1 = 1
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = mp
    L9_1 = L9_1.bitand
    L10_1 = L8_1
    L11_1 = 255
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 == 195 then
      L10_1 = pcall
      L11_1 = MpCommon
      L11_1 = L11_1.RollingQueueErase
      L12_1 = "Etwpatch"
      L10_1(L11_1, L12_1)
      L10_1 = TrackPidAndTechnique
      L11_1 = "MemScanLUA"
      L12_1 = "T1562.006"
      L13_1 = "ETWPatch"
      L10_1(L11_1, L12_1, L13_1)
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
