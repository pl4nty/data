local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = {}
L2_1 = 3600
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L0_1 = L3_1
    end
  end
end
if L0_1 ~= nil then
  L3_1 = table
  L3_1 = L3_1.insert
  L4_1 = L1_1
  L5_1 = L0_1
  L3_1(L4_1, L5_1)
end
L3_1 = #L1_1
if 0 < L3_1 then
  L3_1 = setMalwareManifest
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1(L4_1, L5_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
