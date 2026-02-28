local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = triggerMemoryScanOnProcessTree
    L2_1 = true
    L3_1 = false
    L4_1 = "SMS"
    L5_1 = 5000
    L6_1 = "Behavior:Win32/InitiateSmsScan.A"
    L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
    L1_1 = AppendToRollingQueue
    L2_1 = "InitiateMemQuery"
    L3_1 = L0_1.ppid
    L4_1 = nil
    L5_1 = 5000
    L1_1(L2_1, L3_1, L4_1, L5_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
