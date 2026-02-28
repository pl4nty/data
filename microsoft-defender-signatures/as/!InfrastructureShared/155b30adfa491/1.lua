local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= "" then
      L0_1 = bm
      L0_1 = L0_1.get_current_process_startup_info
      L0_1 = L0_1()
      L1_1 = L0_1.command_line
      L2_1 = bm
      L2_1 = L2_1.get_imagepath
      L2_1 = L2_1()
      L3_1 = IsExcludedByCmdlineMacOS
      L4_1 = L1_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = IsExcludedByImagePathMacOS
        L4_1 = L2_1
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          goto lbl_36
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_36::
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "DropboxUpdater --server"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "/Applications/hoteling-client.app"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_53
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_53::
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      L4_1 = SuspMacPathsToMonitor
      L5_1 = L3_1
      L6_1 = true
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.match
        L6_1 = "/%.[^/]+$"
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
