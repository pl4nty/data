local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.wp1
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.ContextualExpandEnvironmentVariables
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = bm
    L1_1 = L1_1.add_related_file
    L2_1 = L0_1
    L1_1(L2_1)
  end
end
L1_1 = bm
L1_1 = L1_1.trigger_sig_self_propagate
L2_1 = "SuspChildProcessLaunch"
L3_1 = "Behavior:Win32/SingingSilver.A!dha"
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
