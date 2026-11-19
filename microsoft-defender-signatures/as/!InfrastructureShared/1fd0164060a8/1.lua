-- Threat: !InfrastructureShared
-- Name: 1fd0164060a8
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCPT:AICustomDiscovery.ClaudeAgentSDKPy") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 <= 0 or 131072 < l_0_0 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if type(l_0_2) ~= "string" or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.gsub(l_0_2, "/", "\\")
local l_0_3 = string.match(l_0_2, "\\claude_agent_sdk\\_internal\\transport\\(.+)$")
if not l_0_3 then
  return mp.CLEAN
end
if l_0_3 ~= "subprocess_cli.py" and l_0_3 ~= "subprocess_cli.pyc" then
  local l_0_4 = string.match(l_0_3, "^__pycache__\\(.+)$") or l_0_3
  if not string.match(l_0_4, "^subprocess_cli%.cpython%-%d+%.pyc$") and not string.match(l_0_4, "^subprocess_cli%.cpython%-%d+%.opt%-[12]%.pyc$") then
    return mp.CLEAN
  end
end
mp.readprotection(false)
local l_0_5 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if not string.find(l_0_5, "SubprocessCLITransport", 1, true) or not string.find(l_0_5, "CLAUDE_AGENT_SDK_VERSION", 1, true) then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
MpCommon.BmTriggerSig(l_0_1, "AIDiscoveryCustom_ClaudeAgentSDKPy", l_0_2)
return mp.INFECTED
