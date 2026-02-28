local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.GetParentProcInfo
  L3_1 = L1_1.ppid
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = IsKeyInRollingQueue
    L4_1 = "iscsicpl_bypass"
    L5_1 = L2_1.ppid
    L6_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
