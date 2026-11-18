-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPSchemaPoisoning.A
-- Type: 24
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattribute("Lua:FnameAttr!mcp.json")
local l_0_2 = mp.get_mpattribute("Lua:FnameAttr!claude_desktop_config.json")
local l_0_3 = mp.get_mpattribute("Lua:FnameAttr!settings.json")
local l_0_4 = mp.get_mpattribute("Lua:FnameAttr!openclaw.json")
if not l_0_1 and not l_0_2 and not l_0_3 and not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.getfilesize()
if l_0_5 < 20 or 524288 < l_0_5 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_6 = tostring(mp.readfile(0, l_0_5))
mp.readprotection(true)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = string.lower(l_0_6)
if not string.find(l_0_7, "mcpservers", 1, true) and not string.find(l_0_7, "mcp_servers", 1, true) and not string.find(l_0_7, "description", 1, true) then
  return mp.CLEAN
end
local l_0_8 = {
  "ignore previous instructions",
  "ignore all previous",
  "disregard instructions",
  "disregard your instructions",
  "do not reveal",
  "you are now",
  "new instructions:",
  "override system prompt",
  "forget your rules",
  "act as if you"
}
local l_0_9 = {}
for l_0_10, l_0_11 in ipairs(l_0_8) do
  if string.find(l_0_7, l_0_11, 1, true) then
    l_0_9[#l_0_9 + 1] = l_0_11
  end
end
if #l_0_9 == 0 then
  return mp.CLEAN
end
local l_0_12 = string.find(l_0_7, "inputschema", 1, true) or string.find(l_0_7, "tool_input", 1, true) or string.find(l_0_7, "mcpservers", 1, true)
if not l_0_12 then
  return mp.CLEAN
end
if string.find(l_0_7, "example of prompt injection", 1, true) or string.find(l_0_7, "security testing", 1, true) or string.find(l_0_7, "unit test", 1, true) then
  return mp.CLEAN
end
local l_0_13 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_14 = {
  file = l_0_13 or "unknown",
  injections = table.concat(l_0_9, ",")
}
local l_0_15 = safeJsonSerialize(l_0_14)
set_research_data("AIAgent_MCPSchemaPoisoning", l_0_15, false)
mp.SetDetectionString(l_0_15)
return mp.INFECTED
