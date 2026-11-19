-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/ShaiWorm.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & MpOnOpenOrCloseRtpScan & (Lua:JSExt | Lua:JSONExt | Lua:MDCExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or #l_0_0 <= 10 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "node.exe" and l_0_0 ~= "bun.exe" then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!.copilot") and not mp.get_mpattribute("Lua:LastFolder0!.vscode") and not mp.get_mpattribute("Lua:LastFolder0!.gemini") and not mp.get_mpattribute("Lua:LastFolder0!.github") and not mp.get_mpattribute("Lua:LastFolder0!.claude") and not mp.get_mpattribute("Lua:LastFolder0!rules") and not mp.get_mpattribute("Lua:LastFolder0!.windsurf") then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  ".claude",
  ".cursor/rules",
  ".cursor\\rules",
  ".vscode",
  ".gemini",
  ".github",
  ".copilot",
  ".aider",
  ".windsurf"
}
if not contains(l_0_1, l_0_3, true) then
  return mp.CLEAN
end
local l_0_4 = {
  "setup.mjs",
  "setup.mdc",
  "setup.js",
  "settings.json",
  "tasks.json",
  "ai_init.js",
  "ai_setup.sh",
  "index.js",
  "_index.js"
}
if not contains(l_0_2, l_0_4, true) then
  return mp.CLEAN
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_5 then
  return mp.CLEAN
end
if not contains(l_0_5, {"node", "bun"}) then
  return mp.CLEAN
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = mp.GetProcessCommandLine(l_0_6)
if not l_0_7 then
  return mp.CLEAN
end
if l_0_7:find("node.*%.m?js") or l_0_7:find("bun.*%.m?js") then
  return mp.INFECTED
end
return mp.CLEAN
