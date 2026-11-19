-- Threat: !InfrastructureShared
-- Name: !#Lua:PersistContext/RemoteAccessTool
-- Type: 10
-- MpAttributes: AGGR:Win32/RemoteAccessTool.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_0, "RemoteAccessTool") then
  MpCommon.AppendPersistContext(l_0_0, "RemoteAccessTool", 0)
end
if not MpCommon.QueryPersistContext(l_0_0, "T1219") then
  MpCommon.AppendPersistContext(l_0_0, "T1219", 0)
end
return mp.CLEAN
