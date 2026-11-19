-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPAzureSASLeak.A
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
if l_0_4 < 50 or 524288 < l_0_4 then
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
local l_0_7 = string.find(l_0_6, "blob.core.windows.net", 1, true) or string.find(l_0_6, "file.core.windows.net", 1, true) or string.find(l_0_6, "queue.core.windows.net", 1, true) or string.find(l_0_6, "table.core.windows.net", 1, true)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = 0
if string.find(l_0_5, "?sv=", 1, true) then
  l_0_8 = l_0_8 + 1
end
if string.find(l_0_5, "&sig=", 1, true) then
  l_0_8 = l_0_8 + 1
end
if string.find(l_0_5, "&se=", 1, true) then
  l_0_8 = l_0_8 + 1
end
if string.find(l_0_5, "&sp=", 1, true) then
  l_0_8 = l_0_8 + 1
end
if l_0_8 < 3 then
  return mp.CLEAN
end
if string.find(l_0_6, "<your-sas-token>", 1, true) or string.find(l_0_6, "your_sas_token", 1, true) or string.find(l_0_6, "example.blob.core", 1, true) then
  return mp.CLEAN
end
local l_0_9 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_10 = {
  file = l_0_9 or "unknown",
  sas_param_count = tostring(l_0_8)
}
local l_0_11 = safeJsonSerialize(l_0_10)
set_research_data("AIAgent_MCPAzureSASLeak", l_0_11, false)
mp.SetDetectionString(l_0_11)
return mp.INFECTED
