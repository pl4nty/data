-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPSSHKeyLeak.A
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
if not string.find(l_0_6, "mcpservers", 1, true) and not string.find(l_0_6, "mcp_servers", 1, true) and not string.find(l_0_6, "\"servers\"", 1, true) then
  return mp.CLEAN
end
local l_0_7
if string.find(l_0_5, "-----BEGIN RSA PRIVATE KEY-----", 1, true) then
  l_0_7 = "rsa"
elseif string.find(l_0_5, "-----BEGIN DSA PRIVATE KEY-----", 1, true) then
  l_0_7 = "dsa"
elseif string.find(l_0_5, "-----BEGIN EC PRIVATE KEY-----", 1, true) then
  l_0_7 = "ec"
elseif string.find(l_0_5, "-----BEGIN OPENSSH PRIVATE KEY-----", 1, true) then
  l_0_7 = "openssh"
elseif string.find(l_0_5, "-----BEGIN PRIVATE KEY-----", 1, true) then
  l_0_7 = "generic"
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_9 = {
  file = l_0_8 or "unknown",
  key_type = l_0_7
}
local l_0_10 = safeJsonSerialize(l_0_9)
set_research_data("AIAgent_MCPSSHKeyLeak", l_0_10, false)
mp.SetDetectionString(l_0_10)
return mp.INFECTED
