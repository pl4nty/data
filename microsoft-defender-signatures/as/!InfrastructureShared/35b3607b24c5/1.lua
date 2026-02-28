local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  L3_1 = L1_1.command_line
  if L3_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "devenv.exe"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "msbuild.exe"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "cl.exe"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          goto lbl_36
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    do return L4_1 end
    ::lbl_36::
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = L2_1
    L6_1 = "T1543.003"
    L7_1 = "persistence"
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
