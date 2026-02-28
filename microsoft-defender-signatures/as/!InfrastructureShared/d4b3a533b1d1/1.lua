local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[2]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_29::
L1_1 = IsExcludedByCmdlineMacOS
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = IsExcludedByImagePathMacOS
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_46
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_46::
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L0_1 = L1_1.utf8p1
L1_1 = SuspMacPathsToMonitor
L2_1 = L0_1
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = IsKeyValuePairInRollingQueue
  L2_1 = "MAC_UNS_ADHOC_PATHS"
  L3_1 = "unsigned_adhoc_items"
  L4_1 = L0_1
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
