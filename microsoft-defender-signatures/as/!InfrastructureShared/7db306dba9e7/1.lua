-- Threat: !InfrastructureShared
-- Name: 7db306dba9e7
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 ~= nil and string.len(l_0_0) > 3 then
  l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, ".dll", 1, true) == nil and string.find(l_0_1, ".cpl", 1, true) == nil and string.find(l_0_1, ".ocx", 1, true) == nil and string.find(l_0_1, ".tmp", 1, true) == nil and string.find(l_0_1, ".dat", 1, true) == nil and string.find(l_0_1, ".tlb", 1, true) == nil and string.find(l_0_1, "-", 1, true) == nil and string.find(l_0_1, ".exe", 1, true) == nil and string.find(l_0_1, ".xll", 1, true) == nil and string.find(l_0_1, "\\microsoft\\word\\startup\\%a+.%a") ~= nil or string.find(l_0_1, "\\%d+.dll") ~= nil or string.find(l_0_1, "startw", 1, true) ~= nil or string.find(l_0_1, "dllregisterserver", 1, true) ~= nil or string.find(l_0_1, "plugininit", 1, true) ~= nil or string.find(l_0_1, "\\appdata\\roaming\\%a+.dll") ~= nil then
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_2 ~= nil then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
        bm.add_related_file(l_0_4)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
