-- Threat: !InfrastructureShared
-- Name: 91b3e78338e5
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1.command_line)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
local l_0_5
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_5 = this_sigattrlog[5].utf8p2
end
if l_0_5 ~= nil then
  local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_5)
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if sysio.IsFileExists(l_0_8) then
      bm.add_related_file(l_0_8)
    end
  end
end
return mp.INFECTED
