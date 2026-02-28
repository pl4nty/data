local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L0_1 = L2_1.utf8p1
  end
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= "" then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L0_1 = L2_1.utf8p1
    end
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[9]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= "" then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[9]
          L0_1 = L2_1.utf8p1
        end
      end
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L1_1 = L2_1.utf8p2
  end
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= "" then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L1_1 = L2_1.utf8p2
      end
    end
  end
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "([^/]+%.app.*)/([^/]+)$"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L1_1 ~= nil and L3_1 ~= nil and L2_1 ~= nil then
  if L3_1 ~= "app.asar" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = L3_1
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = L2_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
