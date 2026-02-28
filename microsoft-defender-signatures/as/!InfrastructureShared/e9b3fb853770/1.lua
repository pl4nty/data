local L0_1, L1_1, L2_1, L3_1
L0_1 = IsDetectionThresholdMet
L1_1 = "BM"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = GetTacticsTableForPid
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 ~= nil then
      L2_1 = type
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 == "table" then
        L2_1 = #L1_1
        if 5 < L2_1 then
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
