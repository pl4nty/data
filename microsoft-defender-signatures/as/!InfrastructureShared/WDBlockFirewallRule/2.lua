local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Remediation
L0_1 = L0_1.Threat
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1.Name
  L3_1 = "Behavior:Win32/WDBlockFirewallRule.P"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    goto lbl_23
  end
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1.Name
L3_1 = "Behavior:Win32/WDBlockFirewallRule.S"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
::lbl_23::
if L1_1 then
  L1_1 = Remediation
  L1_1 = L1_1.SetRebootRequired
  L1_1()
end
