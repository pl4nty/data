-- Threat: !InfrastructureShared
-- Name: b2b303dad56a
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1.command_line)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
local l_0_5
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_5 = this_sigattrlog[3].utf8p2
end
if l_0_5 ~= nil then
  for l_0_6 in l_0_5:gmatch("(%%userprofile%%\\.-ps1)") do
    local l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_7) then
      bm.add_related_file(l_0_7)
    end
  end
end
return mp.INFECTED
