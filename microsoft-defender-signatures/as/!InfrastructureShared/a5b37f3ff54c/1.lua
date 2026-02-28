local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = versioning
L0_1 = L0_1.IsSeville
L0_1 = L0_1()
if not L0_1 then
  L0_1 = versioning
  L0_1 = L0_1.IsServer
  L0_1 = L0_1()
  if not L0_1 then
    L0_1 = MpCommon
    L0_1 = L0_1.IsSampled
    L1_1 = 11000
    L2_1 = true
    L3_1 = true
    L4_1 = true
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
    if L0_1 == false then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = getCurrentProcessInjectors
L0_1, L1_1, L2_1 = L0_1()
if L2_1 ~= nil then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "GenRansom_injected"
  L5_1 = safeJsonSerialize
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
if L1_1 ~= nil then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "GenRansom_injector"
  L5_1 = safeJsonSerialize
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.utf8p2
  if L3_1 then
    L3_1 = reportGenericRansomware
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    if L3_1 == L4_1 then
      L3_1 = reportTimingData
      L3_1()
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
