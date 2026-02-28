local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = "ScriptDroppedByCurl"
if L0_1 == "wscript.exe" then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L2_1 = L2_1(L3_1)
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L2_1
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Context/CurlDropWscriptLoad"
    L3_1(L4_1)
  end
elseif L0_1 == "cscript.exe" then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L2_1 = L2_1(L3_1)
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L2_1
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Context/CurlDropCscriptLoad"
    L3_1(L4_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
