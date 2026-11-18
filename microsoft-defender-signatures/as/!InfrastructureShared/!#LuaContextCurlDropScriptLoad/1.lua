-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/CurlDropScriptLoad
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
l_0_0 = l_0_0 and l_0_0:lower()
local l_0_1 = "ScriptDroppedByCurl"
if l_0_0 == "wscript.exe" then
  local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if MpCommon.QueryPersistContext(l_0_2, l_0_1) then
    mp.set_mpattribute("Lua:Context/CurlDropWscriptLoad")
  end
elseif l_0_0 == "cscript.exe" then
  local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if MpCommon.QueryPersistContext(l_0_3, l_0_1) then
    mp.set_mpattribute("Lua:Context/CurlDropCscriptLoad")
  end
end
return mp.CLEAN
