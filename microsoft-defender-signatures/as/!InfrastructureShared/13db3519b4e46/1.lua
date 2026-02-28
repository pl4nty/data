local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 then
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
      L2_1 = L1_1.match
      L4_1 = "\\ltsvc.exe"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "\\veeamguesthelper.exe"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "\\avast.+\\regsvr.exe"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L3_1 = L1_1
        L2_1 = L1_1.match
        L4_1 = "\\avg.+\\regsvr.exe"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          goto lbl_48
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_48::
      L2_1 = bm_AddRelatedFileFromCommandLine
      L3_1 = L0_1.command_line
      L4_1 = nil
      L5_1 = nil
      L6_1 = 1
      L2_1(L3_1, L4_1, L5_1, L6_1)
      L2_1 = TrackPidAndTechniqueBM
      L3_1 = "BM"
      L4_1 = "T1561.002"
      L5_1 = "folderguard_blk_rsm"
      L2_1(L3_1, L4_1, L5_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
