local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L2_1 = "start ([^%s]+)$"
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 then
      L1_1 = MpCommon
      L1_1 = L1_1.QueryPersistContext
      L2_1 = L0_1
      L3_1 = "NewServiceCreation"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
