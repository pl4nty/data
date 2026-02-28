local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsBasToolFilenameContext
L2_1 = L0_1
L1_1, L2_1 = L1_1(L2_1)
if L1_1 then
  if L2_1 ~= nil then
    L3_1 = #L2_1
    if 0 < L3_1 and L2_1 ~= "any" then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:Context/BasToolFileContext.A!"
      L5_1 = L2_1
      L4_1 = L4_1 .. L5_1
      L3_1(L4_1)
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
