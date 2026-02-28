local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L1_1 = L2_1[4]
end
L2_1 = getMalwareManifest
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    if L0_1 == L7_1 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
    if L1_1 ~= nil then
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L1_1.utf8p1
      L8_1 = L8_1(L9_1)
      if L8_1 ~= nil then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = L7_1
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L7_1
          L9_1(L10_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = L1_1.utf8p2
      L9_1 = L9_1(L10_1)
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L9_1
      L12_1 = L7_1
      L13_1 = 1
      L14_1 = true
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 then
        L10_1 = bm
        L10_1 = L10_1.add_related_file
        L11_1 = L7_1
        L10_1(L11_1)
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
