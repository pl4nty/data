local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[7]
      L0_1 = L3_1.utf8p1
  end
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.utf8p1
      if L3_1 ~= "" then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[8]
        L0_1 = L3_1.utf8p1
      end
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= "" then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L1_1 = L3_1.utf8p1
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L2_1 = L3_1.utf8p2
        end
      end
    end
  end
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = IsPersistenceExcludedMacOS
    L4_1 = L0_1
    L5_1 = L1_1
    L6_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      goto lbl_89
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_89::
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "mtxsetup -log /private/tmp/"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "/Int%-Test%d+%.plist$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L4_1 = L1_1
  L3_1 = L1_1.match
  L5_1 = "^/private/tmp/Int%-Test%d+/msp%-agent%-core$"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L0_1
  L5_1 = "/System/"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= 1 then
    goto lbl_132
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_132::
L3_1 = IsKeyValuePairInRollingQueue
L4_1 = "MAC_UNS_ADHOC_PATHS"
L5_1 = "unsigned_adhoc_items"
L6_1 = L1_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L1_1
  L3_1(L4_1)
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "AdhocPersistMacOS"
  L5_1 = L0_1
  L3_1(L4_1, L5_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
