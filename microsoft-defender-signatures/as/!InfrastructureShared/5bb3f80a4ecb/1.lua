local L0_1, L1_1, L2_1
L0_1 = versioning
L0_1 = L0_1.IsSeville
L0_1 = L0_1()
if not L0_1 then
  L0_1 = versioning
  L0_1 = L0_1.IsServer
  L0_1 = L0_1()
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = reportGenericRansomware
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    L2_1 = true
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    if L0_1 == L1_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
