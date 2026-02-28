local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "Behavior:Win32/MpTamperControlSet.B"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = sysio
  L1_1 = L1_1.RegOpenKey
  L2_1 = "HKLM\\SYSTEM\\Select"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = GetRollingQueueAsHashTable
    L3_1 = "MpTamperRegKeyOldValues_ControlSet"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L3_1 = false
      return L3_1
    end
    L3_1 = pairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = sysio
      L8_1 = L8_1.GetRegValueAsDword
      L9_1 = L1_1
      L10_1 = L6_1
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 ~= L7_1 then
        L9_1 = sysio
        L9_1 = L9_1.SetRegValueAsDword
        L10_1 = L1_1
        L11_1 = L6_1
        L12_1 = L7_1
        L9_1(L10_1, L11_1, L12_1)
      end
    end
  end
end
