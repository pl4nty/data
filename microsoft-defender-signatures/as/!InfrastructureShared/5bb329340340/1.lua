local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p1
      L1_1 = bm
      L1_1 = L1_1.get_imagepath
      L1_1 = L1_1()
      if L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = IsKeyValuePairInRollingQueue
      L3_1 = "MAC_UNS_ADHOC_PATHS"
      L4_1 = "unsigned_adhoc_items"
      L5_1 = L0_1
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if not L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = bm
      L2_1 = L2_1.trigger_sig
      L3_1 = "MacDelQuarantineAttr"
      L4_1 = L0_1
      L2_1(L3_1, L4_1)
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/xattr"
      L5_1 = -6
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        L2_1 = mp
        L2_1 = L2_1.GetParentProcInfo
        L2_1 = L2_1()
        if L2_1 ~= nil then
          L3_1 = L2_1.ppid
          if L3_1 ~= nil then
            L3_1 = bm
            L3_1 = L3_1.trigger_sig
            L4_1 = "MacDelQuarantineAttr"
            L5_1 = L0_1
            L6_1 = L2_1.ppid
            L3_1(L4_1, L5_1, L6_1)
          end
        end
      end
      L2_1 = TrackPidAndTechniqueBM
      L3_1 = "BM"
      L4_1 = "T1553.001"
      L5_1 = "DefenseEvasion_GateKeeperBypass_xattr"
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
