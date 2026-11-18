-- Threat: !InfrastructureShared
-- Name: 4db305356e45
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil and 3 < string.len(l_0_0) then
  l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "\\%d+.dll") ~= nil or string.find(l_0_1, "startw", 1, true) ~= nil or string.find(l_0_1, "dllregisterserver", 1, true) ~= nil or string.find(l_0_1, "plugininit", 1, true) ~= nil or string.find(l_0_1, "\\appdata\\roaming\\%a+.dll") ~= nil then
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
