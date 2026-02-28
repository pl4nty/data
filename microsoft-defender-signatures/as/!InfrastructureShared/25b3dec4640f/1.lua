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
    L2_1 = StringStartsWith
    L3_1 = L1_1
    L4_1 = "%"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "\\wbem\\wmiprvse.exe"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "-embedding"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_39
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_39::
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = L0_1.ppid
    L4_1 = "T1036"
    L5_1 = "masq_wmiprvse"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
