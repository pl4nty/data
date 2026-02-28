local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.ppid
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "RMM"
L2_1 = "programfiles_targeted"
L3_1 = "PFAppTracked"
L4_1 = startTrackingApp
L5_1 = L0_1.ppid
L6_1 = L1_1
L7_1 = L2_1
L8_1 = L3_1
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L6_1 = L5_1.IsNewApp
if L6_1 then
  L5_1.SignatureName = "Bm/PFA_RMM.A"
  L6_1 = bm
  L6_1 = L6_1.trigger_sig
  L7_1 = "SetProcessAttrib"
  L8_1 = safeJsonSerialize
  L9_1 = L5_1
  L8_1, L9_1 = L8_1(L9_1)
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
