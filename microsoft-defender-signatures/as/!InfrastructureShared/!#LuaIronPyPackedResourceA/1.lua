local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:TopLevelFileExt.A!exe"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:TopLevelFileExt.A!dll"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_38
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "->%[msilres:ipdll.(.-)%]"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil and L1_1 ~= "" then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:FePyCompiledResourcePresent"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:FePyCompiledRes!"
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_38::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
