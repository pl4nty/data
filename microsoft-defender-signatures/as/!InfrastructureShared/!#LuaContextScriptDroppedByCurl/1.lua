-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/ScriptDroppedByCurl
-- Type: 13
-- MpAttributes: MpNewlyCreatedHint & BM_SCRIPT_OR_TEXT_FILE & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 == "curl.exe" then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_2 = "ScriptDroppedByCurl"
  local l_0_3 = MpCommon.QueryPersistContext(l_0_1, l_0_2)
  if not l_0_3 then
    MpCommon.AppendPersistContext(l_0_1, l_0_2, 100)
  end
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
