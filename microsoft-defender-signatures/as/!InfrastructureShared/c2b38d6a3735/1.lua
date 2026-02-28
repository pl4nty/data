local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "gpsvc"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "schedule"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_30
      end
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_30::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
