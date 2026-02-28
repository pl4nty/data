local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\program files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "\\([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = false
if L2_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = L2_1
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L3_1 = true
  end
end
if L3_1 == false then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = ":"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= nil and 0 <= L4_1 then
    L5_1 = string
    L5_1 = L5_1.sub
    L6_1 = L2_1
    L7_1 = 1
    L8_1 = L4_1 - 1
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    if L5_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L0_1
      L8_1 = L5_1
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 then
        L3_1 = true
      end
    end
  end
end
if L3_1 == true then
  L4_1 = bm_AddRelatedFileFromCommandLine
  L5_1 = L0_1
  L6_1 = nil
  L7_1 = nil
  L8_1 = 15
  L4_1(L5_1, L6_1, L7_1, L8_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
