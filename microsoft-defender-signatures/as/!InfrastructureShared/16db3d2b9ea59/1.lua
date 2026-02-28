local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L0_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L1_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L2_1 = L3_1.utf8p2
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L2_1 = L3_1.utf8p2
    if L2_1 and L1_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      L5_1 = "tcpip6.hiv"
      L6_1 = -20
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = L1_1
        L4_1 = L4_1(L5_1)
        L5_1 = "networx"
        L6_1 = -20
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
      end
    end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L2_1 = L3_1.utf8p2
    end
  end
end
if L2_1 then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = bm
      L9_1 = L9_1.add_related_file
      L10_1 = L8_1
      L9_1(L10_1)
    end
  end
end
if L0_1 then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = bm
      L9_1 = L9_1.add_related_file
      L10_1 = L8_1
      L9_1(L10_1)
    end
  end
end
L3_1 = add_parents
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
