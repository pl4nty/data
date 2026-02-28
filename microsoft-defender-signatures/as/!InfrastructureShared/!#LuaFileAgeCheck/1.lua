local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILE_AGE
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 < 86400 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:FileCreatedLT1d"
  L1_1(L2_1)
end
if L0_1 < 604800 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:FileCreatedLT7d"
  L1_1(L2_1)
else
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:FileCreatedGT7d"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
