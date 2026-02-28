local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "Behavior:Win32/MpTamperDrv.A"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = GetRollingQueueAsHashTable
  L2_1 = "MpTamperRegKeyOldValues_Altitude"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L2_1 = false
    return L2_1
  end
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.RegOpenKey
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L8_1 = sysio
      L8_1 = L8_1.SetRegValueAsDword
      L9_1 = L7_1
      L10_1 = "Altitude"
      L11_1 = L6_1
      L8_1(L9_1, L10_1, L11_1)
    end
  end
end
