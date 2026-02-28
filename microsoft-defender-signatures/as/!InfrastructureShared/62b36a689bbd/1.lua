local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsKeyValuePairInRollingQueue
L2_1 = "MAC_UNS_ADHOC_PATHS"
L3_1 = "unsigned_adhoc_items"
L4_1 = L0_1
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = SuspMacPathsToMonitor
  L2_1 = L0_1
  L3_1 = true
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/Users/[^/]+/Downloads/"
    L4_1 = 1
    L5_1 = false
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/Users/[^/]+/Documents/"
      L4_1 = 1
      L5_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "/Users/[^/]+/Desktop/"
        L4_1 = 1
        L5_1 = false
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_67
        end
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_67::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
