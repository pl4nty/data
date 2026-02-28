local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:PeOriginalName!psexesvc.exe"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 4
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\\\?\\" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 5
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = 8
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\device\\" then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  if L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == "psexesvc.exe" then
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "PsExecServiceStandardName"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = L0_1
    L5_1 = "PsExecServiceStandardName"
    L6_1 = 5
    L3_1(L4_1, L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L0_1
L4_1 = "PsExecServiceNonStandardName"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.AppendPersistContext
  L4_1 = L0_1
  L5_1 = "PsExecServiceNonStandardName"
  L6_1 = 5
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
