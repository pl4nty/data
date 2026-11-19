-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPSupplyChain.A
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
if not string.find(l_0_7, "mcp", 1, true) then
  return mp.CLEAN
end
local l_0_8 = {
  "claud-code",
  "cloude-code",
  "cloude",
  "@anthrpic/mcp",
  "@anthropc/mcp",
  "@anthroplc/mcp",
  "@modelcontextprotoco1",
  "@mode1contextprotocol",
  "mcp-server-fetch-",
  "mcp-server--",
  "crypto-locale",
  "crypto-reader-info",
  "detect-cache",
  "format-defaults",
  "hardhta",
  "locale-loader-pro",
  "naniod",
  "node-native-bridge",
  "opencraw",
  "parse-compat",
  "rimarf",
  "scan-store",
  "secp256",
  "suport-color",
  "veim",
  "yarsg"
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
local l_0_12 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_13 = {
  file = l_0_12 or "unknown",
  suspicious_packages = table.concat(l_0_9, ",")
}
local l_0_14 = safeJsonSerialize(l_0_13)
set_research_data("AIAgent_MCPSSHKeyLeak", l_0_14, false)
mp.SetDetectionString(l_0_14)
return mp.INFECTED
