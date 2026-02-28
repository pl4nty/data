local L0_1, L1_1, L2_1, L3_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsTechniqueObservedForPid
  L1_1 = "BM"
  L2_1 = "ttexclusion"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = IsTacticObservedForPid
    L1_1 = "BM"
    L2_1 = "ttexclusion"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L0_1 = IsTacticObservedForPid
      L1_1 = "BM"
      L2_1 = "ttexclusion_cln"
      L0_1 = L0_1(L1_1, L2_1)
      if not L0_1 then
        goto lbl_26
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_26::
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.len
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if 700 <= L1_1 then
  L1_1 = AddResearchData
  L2_1 = "BM"
  L3_1 = true
  L1_1(L2_1, L3_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
