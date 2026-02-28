local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "Behavior:Win32/PPLInjection.A"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = GetRollingQueueKeyValue
  L2_1 = "MpTamperRegKeyOldValues"
  L3_1 = "TreatAs"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    return
  end
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "(.*)|(.*)"
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  if not L2_1 or not L3_1 then
    return
  end
  L4_1 = sysio
  L4_1 = L4_1.RegOpenKey
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.SetRegValueAsString
    L6_1 = L4_1
    L7_1 = ""
    L8_1 = L3_1
    L5_1(L6_1, L7_1, L8_1)
  end
end
