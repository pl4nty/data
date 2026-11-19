-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPConfigTamper.A
-- Type: 24
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattribute("Lua:FnameAttr!mcp.json")
local l_0_2 = mp.get_mpattribute("Lua:FnameAttr!claude_desktop_config.json")
local l_0_3 = mp.get_mpattribute("Lua:FnameAttr!openclaw.json")
if not l_0_1 and not l_0_2 and not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.getfilesize()
if l_0_4 < 20 or 524288 < l_0_4 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_5 = tostring(mp.readfile(0, l_0_4))
mp.readprotection(true)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5)
if not string.find(l_0_6, "mcpservers", 1, true) and not string.find(l_0_6, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_7 = {}
if string.find(l_0_5, "process%.env%.") then
  l_0_7[#l_0_7 + 1] = "process_env"
end
if string.find(l_0_5, "os%.environ") then
  l_0_7[#l_0_7 + 1] = "os_environ"
end
if string.find(l_0_5, "$(", 1, true) then
  l_0_7[#l_0_7 + 1] = "shell_cmd_substitution"
end
if string.find(l_0_6, "\"sse\"", 1, true) or string.find(l_0_6, "\"transport\":\"sse\"", 1, true) then
  local l_0_8 = string.find(l_0_6, "http://", 1, true) or string.find(l_0_6, "https://", 1, true)
  local l_0_9 = string.find(l_0_6, "localhost", 1, true) or string.find(l_0_6, "127.0.0.1", 1, true)
  if l_0_8 and not l_0_9 then
    l_0_7[#l_0_7 + 1] = "remote_sse_transport"
  end
end
if #l_0_7 == 0 then
  return mp.CLEAN
end
local l_0_10 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_11 = {
  file = l_0_10 or "unknown",
  tamper_types = table.concat(l_0_7, ",")
}
local l_0_12 = safeJsonSerialize(l_0_11)
set_research_data("AIAgent_MCPConfigTamper", l_0_12, false)
mp.SetDetectionString(l_0_12)
return mp.INFECTED
