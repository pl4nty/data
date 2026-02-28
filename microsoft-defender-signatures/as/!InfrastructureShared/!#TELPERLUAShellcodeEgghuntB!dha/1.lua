local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 500000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 700000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
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
  L3_1 = 1024
  L4_1 = 256
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L2_1
  L5_1 = "\176\014\229\234bJ\206\017\190\214\000\170\000a\016\128"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.readfile
    L4_1 = 2000
    L5_1 = 1000
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L3_1
    L6_1 = "U\139\236\129\236%X%X%z%z\199E\252%X%X%z%z\198E"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L6_1 = L4_1
      L5_1 = L4_1.len
      L5_1 = L5_1(L6_1)
      if L5_1 == 18 then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
