local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[15]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[15]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = this_sigattrlog
    L3_1 = L3_1[15]
    L3_1 = L3_1.utf8p1
    L4_1 = "\\([^\\]+%.exe)"
    L2_1 = L2_1(L3_1, L4_1)
    L0_1 = L2_1
  end
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "program files"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "system32"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = "\\([^\\]+%.exe)"
      L3_1 = L3_1(L4_1, L5_1)
      L1_1 = L3_1
    end
  end
end
if L1_1 ~= nil and L0_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
  if L1_1 ~= L0_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
