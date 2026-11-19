-- Threat: !InfrastructureShared
-- Name: 55b3bd984ee4
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5 = string.lower(l_0_4.image_path)
  if l_0_5 ~= nil and (string.find(l_0_5, "\\wmiprvse.exe", 1, true) or string.find(l_0_5, "\\winrshost.exe", 1, true) or string.find(l_0_5, "\\powershell.exe", 1, true) or string.find(l_0_5, "\\scrcons.exe", 1, true) or string.find(l_0_5, "\\wsmprovhost.exe", 1, true) or string.find(l_0_5, "\\cmd.exe", 1, true)) then
    if l_0_0 ~= nil and string.len(l_0_0) > 3 then
      local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_0)
      if l_0_6 ~= nil then
        for l_0_7, l_0_8 in ipairs(l_0_6) do
          l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
          bm.add_related_file(l_0_8)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
