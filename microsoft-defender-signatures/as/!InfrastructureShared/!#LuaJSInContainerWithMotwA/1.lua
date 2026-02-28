local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:ContainerHasMotw.A"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 and L1_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "//LuaZipWithSingleJS"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:SingleJSInContainerWithMotw.B"
    L2_1(L3_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
