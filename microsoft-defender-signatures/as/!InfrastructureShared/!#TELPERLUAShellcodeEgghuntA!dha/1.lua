local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 500000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->word/activex/activex"
L2_1 = L2_1(L3_1, L4_1)
if nil ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.readprotection
  L3_1 = false
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = 65536
  L4_1 = 3000
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "j&X1\201\137\226d\255\019YZ"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
