local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L0_1 = L1_1.utf8p1
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = isTainted
L2_1 = L0_1
L3_1 = "remote_file_created_taint"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
