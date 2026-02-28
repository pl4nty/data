local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1.Name
  L3_1 = "Behavior:Win32/WDBlockFirewallRule"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = Infrastructure_ScanWDFirewallBlockRules
    L1_1()
  end
end
