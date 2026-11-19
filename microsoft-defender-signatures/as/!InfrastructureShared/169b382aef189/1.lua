-- Threat: !InfrastructureShared
-- Name: 169b382aef189
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
local l_0_2 = this_sigattrlog[1]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = "soul.md"
end
l_0_2 = this_sigattrlog[2]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = "agents.md"
end
l_0_2 = this_sigattrlog[3]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = "agent.md"
end
l_0_2 = this_sigattrlog[4]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = "claude.md"
end
l_0_2 = this_sigattrlog[5]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = "copilot-instructions.md"
end
l_0_2 = this_sigattrlog[6]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = ".cursorrules"
end
l_0_2 = this_sigattrlog[7]
if l_0_0 == nil and l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
  l_0_0 = l_0_2.utf8p1
  l_0_1 = ".clinerules"
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
local l_0_5 = bm.get_current_process_startup_info()
local l_0_6 = ""
if not isnull(l_0_5) and l_0_5.command_line ~= nil then
  l_0_6 = string.lower(l_0_5.command_line)
end
local l_0_7 = contains(l_0_4, {
  "\\node.exe",
  "\\python.exe",
  "\\pythonw.exe",
  "\\pwsh.exe",
  "\\powershell.exe",
  "\\code.exe",
  "\\cursor.exe",
  "\\windsurf.exe",
  "\\claude.exe",
  "\\codex.exe",
  "\\copilot.exe",
  "\\antigravity.exe"
})
local l_0_8 = contains(l_0_6, {
  "openclaw",
  "mcp",
  "modelcontextprotocol",
  "agent",
  "assistant",
  "claude",
  "codex",
  "copilot",
  "cursor",
  "windsurf",
  "soul.md"
})
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
bm.add_related_string("agent_guardrail_file", l_0_1 or "unknown", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1565.001", "Impact")
add_parents()
return mp.INFECTED
