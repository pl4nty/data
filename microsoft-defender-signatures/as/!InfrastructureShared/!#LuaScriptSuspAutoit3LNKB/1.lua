local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\microsoft\\windows\\recent"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:ParentProcNameAttr!cmd.exe"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "Lua:LnkTargetFnameExt!exe"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "Lua:LnkTargetLastFolder2!appdata"
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.GetLnkInfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.BasePath
if L2_1 ~= nil then
  L3_1 = #L2_1
  if 1 < L3_1 then
    L3_1 = IsKeyInRollingQueue
    L4_1 = "RenamedAutoitPath"
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L2_1
    L5_1 = L5_1(L6_1)
    L6_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
