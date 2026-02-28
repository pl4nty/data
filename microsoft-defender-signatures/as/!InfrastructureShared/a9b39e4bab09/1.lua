local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L1_1 = nil
L2_1 = nil

function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = TrackPidAndTechniqueBM
  L1_2 = "BM"
  L2_2 = "T1040"
  L3_2 = "network-sniffing"
  L0_2(L1_2, L2_2, L3_2)
end

L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/private/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L1_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/private/var/folders/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L2_1 = L4_1
if L1_1 == 1 and L2_1 == nil then
  L4_1 = L3_1
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/users/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L1_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/library/application support/"
L7_1 = 7
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L2_1 = L4_1
if L1_1 == 1 and L2_1 ~= nil then
  L4_1 = L3_1
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
