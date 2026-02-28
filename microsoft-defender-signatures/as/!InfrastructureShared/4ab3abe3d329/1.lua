local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= "" then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[2]
          L0_1 = L2_1.utf8p2
          L2_1 = this_sigattrlog
          L2_1 = L2_1[2]
          L1_1 = L2_1.utf8p1
        end
      end
    end
  end
end
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = "MAC_UNS_ADHOC_PATHS"
  L3_1 = 86400
  L4_1 = IsKeyValuePairInRollingQueue
  L5_1 = L2_1
  L6_1 = "unsigned_adhoc_items"
  L7_1 = L1_1
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if not L4_1 then
    L4_1 = AppendToRollingQueue
    L5_1 = L2_1
    L6_1 = "unsigned_adhoc_items"
    L7_1 = L1_1
    L8_1 = L3_1
    L4_1(L5_1, L6_1, L7_1, L8_1)
    L4_1 = bm
    L4_1 = L4_1.trigger_sig
    L5_1 = "BM_UnsignedOrAdhocMacBin"
    L6_1 = L1_1
    L4_1(L5_1, L6_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
