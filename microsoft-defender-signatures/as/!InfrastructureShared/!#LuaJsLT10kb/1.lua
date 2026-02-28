local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = string
L1_1 = L1_1.sub
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
L3_1 = -3
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 == ".js" or L0_1 == "jse" then
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if 1000 < L1_1 and L1_1 < 10000 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "//LuaJsLT10kb"
    L2_1(L3_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
