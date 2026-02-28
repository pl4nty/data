local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    L2_1 = nil
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L2_1 = L3_1.utf8p2
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L2_1 = L3_1.utf8p2
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[6]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L2_1 = L3_1.utf8p2
        end
      end
    end
    if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" and L2_1 ~= nil and L2_1 ~= "" then
      if L1_1 ~= L2_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = L1_1
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          goto lbl_104
        end
      end
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L1_1
      L5_1 = "(/.+)/.+"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == nil or L3_1 == "" then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = L3_1
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = SuspMacPathsToMonitor
        L5_1 = L0_1
        L6_1 = false
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L4_1 = "mac_scp_file_transfer"
          L5_1 = AppendToRollingQueue
          L6_1 = L4_1
          L7_1 = "file_transferred_path"
          L8_1 = L1_1
          L9_1 = 7200
          L10_1 = 100
          L11_1 = 0
          L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
::lbl_104::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
