local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exclusion:IsPotentialSideLoad.A"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if not L0_1 then
  L1_1 = #L0_1
  if L1_1 < 3 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = isKnownCleanPathContext
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == false then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
