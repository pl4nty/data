local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 110592 or 458752 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
if 404144 < L0_1 then
  L1_1 = tostring
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 403376
  L4_1 = 200
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "regsvr32 %-silent %.%.\\"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
elseif 407504 < L0_1 then
  L1_1 = tostring
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 406992
  L4_1 = 200
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "regsvr32 %-silent %.%.\\"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
elseif 110592 < L0_1 then
  L1_1 = tostring
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 110128
  L4_1 = 200
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "regsvr32 %-silent %.%.\\"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
