-- Threat: !InfrastructureShared
-- Name: 103b3f59f763c
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  local l_0_2 = l_0_1.command_line
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_2:find("rapid7\\.+\\ir_agent.exe") then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
local l_0_6, l_0_7
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_6 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_7 = this_sigattrlog[5].utf8p1
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_7 = this_sigattrlog[6].utf8p1
end
if l_0_6 ~= nil and l_0_7 ~= nil then
  l_0_6 = string.lower(l_0_6)
  local l_0_8 = string.lower(l_0_7:match("\\([^\\]+)$"))
  if l_0_6:find(l_0_8) and sysio.IsFileExists(l_0_7) then
    bm.add_threat_file(l_0_7)
  end
end
return mp.INFECTED
