-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPPiiExposure.A
-- Type: 24
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattribute("Lua:FnameAttr!mcp.json")
local l_0_2 = mp.get_mpattribute("Lua:FnameAttr!claude_desktop_config.json")
if not l_0_1 and not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.getfilesize()
if l_0_3 < 20 or 524288 < l_0_3 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_4 = tostring(mp.readfile(0, l_0_3))
mp.readprotection(true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
if not string.find(l_0_5, "mcpservers", 1, true) and not string.find(l_0_5, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_6 = {}
if string.find(l_0_4, "%d%d%d%-%d%d%-%d%d%d%d") then
  l_0_6[#l_0_6 + 1] = "ssn"
end
if string.find(l_0_4, "%d%d%d%d%-%d%d%d%d%-%d%d%d%d%-%d%d%d%d") or string.find(l_0_4, "%d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d") then
  l_0_6[#l_0_6 + 1] = "credit_card"
end
if string.find(l_0_4, "%u%d%d%d%d%d%d%d%d") then
  l_0_6[#l_0_6 + 1] = "passport"
end
if #l_0_6 == 0 then
  return mp.CLEAN
end
local l_0_7 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_8 = {
  file = l_0_7 or "unknown",
  pii_types = table.concat(l_0_6, ",")
}
local l_0_9 = safeJsonSerialize(l_0_8)
set_research_data("AIAgent_MCPPiiExposure", l_0_9, false)
mp.SetDetectionString(l_0_9)
return mp.INFECTED
