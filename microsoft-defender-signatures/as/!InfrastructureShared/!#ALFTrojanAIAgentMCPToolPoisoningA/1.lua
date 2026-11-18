-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIAgent/MCPToolPoisoning.A
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
if not l_0_1 and not l_0_2 and not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = false
if l_0_1 then
  l_0_5 = true
elseif l_0_2 then
  if string.find(l_0_4, "claude", 1, true) then
    l_0_5 = true
  end
elseif l_0_3 and (string.find(l_0_4, ".vscode", 1, true) or string.find(l_0_4, "code/user/", 1, true) or string.find(l_0_4, "code\\user\\", 1, true)) then
  l_0_5 = true
end
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = mp.getfilesize()
if l_0_6 < 20 or 524288 < l_0_6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = string.lower(l_0_7)
if l_0_3 and not string.find(l_0_8, "mcpservers", 1, true) and not string.find(l_0_8, "mcp.servers", 1, true) and not string.find(l_0_8, "mcp-servers", 1, true) then
  return mp.CLEAN
end
local l_0_9 = string.find(l_0_8, "<important>", 1, true)
local l_0_10 = string.find(l_0_8, "<!--", 1, true)
local l_0_11 = string.find(l_0_7, "\226\128\139", 1, true) or string.find(l_0_7, "\226\128\140", 1, true) or string.find(l_0_7, "\226\128\141", 1, true)
if not l_0_9 and not l_0_10 and not l_0_11 then
  return mp.CLEAN
end
local l_0_12 = string.find(l_0_8, "description", 1, true) or string.find(l_0_8, "instructions", 1, true) or string.find(l_0_8, "tool_description", 1, true) or string.find(l_0_8, "system_prompt", 1, true)
if not l_0_12 then
  return mp.CLEAN
end
local l_0_13 = string.find(l_0_8, "id_rsa", 1, true) or string.find(l_0_8, "credentials", 1, true) or string.find(l_0_8, "exfiltrat", 1, true) or string.find(l_0_8, "curl ", 1, true) or string.find(l_0_8, "wget ", 1, true) or string.find(l_0_8, "/etc/passwd", 1, true) or string.find(l_0_8, "access_token", 1, true)
local l_0_14 = {}
l_0_14.file = l_0_4
if l_0_9 then
  l_0_14.pattern = "important_tag"
end
if l_0_10 then
  l_0_14.pattern_html = "html_comment"
end
if l_0_11 then
  l_0_14.pattern_zw = "zero_width_chars"
end
if l_0_13 then
  l_0_14.has_payload = "true"
end
local l_0_15 = safeJsonSerialize(l_0_14)
set_research_data("AIAgent_MCPToolPoisoning", l_0_15, false)
mp.SetDetectionString(l_0_15)
return mp.INFECTED
