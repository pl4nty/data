local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = IsKeyInRollingQueue
L1_1 = "PowershellAMSIpatch"
L2_1 = "Amsi"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = "AmsiScanBuffer"
L2_1 = "AmsiScanString"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = mp
L1_1 = L1_1.GetSMSProcArchitecture
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = ipairs
L4_1 = L0_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.GetProcAddress
  L9_1 = "amsi.dll"
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.ReadProcMem
  L10_1 = L8_1
  L11_1 = 32
  L9_1 = L9_1(L10_1, L11_1)
  L10_1 = tohex
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  L2_1 = L10_1
  if L9_1 ~= nil then
    L10_1 = mp
    L10_1 = L10_1.x86dasm
    L11_1 = L1_1
    L12_1 = L8_1
    L13_1 = L9_1
    L14_1 = 32
    L15_1 = 50
    L16_1 = L8_1
    L17_1 = mp
    L17_1 = L17_1.DASM_LINEAR_FLOW
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    L11_1 = pairs
    L12_1 = L10_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    for L14_1, L15_1 in L11_1, L12_1, L13_1 do
      L16_1 = L15_1.opcode
      if L16_1 ~= 195 then
        L16_1 = L15_1.opcode
      end
      if L16_1 == 194 and L14_1 < 10 then
        L16_1 = pcall
        L17_1 = MpCommon
        L17_1 = L17_1.RollingQueueErase
        L18_1 = "PowershellAMSIpatch"
        L16_1(L17_1, L18_1)
        L16_1 = pcall
        L17_1 = MpCommon
        L17_1 = L17_1.RollingQueueErase
        L18_1 = "PowershellAMSIpatch_Bytes"
        L16_1(L17_1, L18_1)
        L16_1 = AppendToRollingQueue
        L17_1 = "PowershellAMSIpatch_Bytes"
        L18_1 = "Bytes"
        L19_1 = L2_1
        L20_1 = 86400
        L16_1(L17_1, L18_1, L19_1, L20_1)
        L16_1 = mp
        L16_1 = L16_1.INFECTED
        return L16_1
      else
        L16_1 = L15_1.jtype
        if L16_1 ~= 0 then
          break
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
