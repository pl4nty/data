local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.match
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = "kali%-linux%-%d%d%d%d%.%d%d?%-installer.*%.iso"
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:GoalPackD1"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if L0_1 == 1 then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:GoalPackA"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if 2 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.enum_mpattributesubstring
    L1_1 = "SCPT:GoalPackB"
    L0_1 = L0_1(L1_1)
    L0_1 = #L0_1
    if 3 < L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
