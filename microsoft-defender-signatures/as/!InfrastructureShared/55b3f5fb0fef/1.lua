-- Threat: !InfrastructureShared
-- Name: 55b3f5fb0fef
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    l_0_3 = string.lower(l_0_3)
    if string.find(l_0_3, "control.exe$") == nil and sysio.IsFileExists(l_0_3) and string.find(l_0_3, "\\windows\\.*%.cpl$") == nil and string.find(l_0_3, "\\windows\\.*%.dll$") == nil then
      bm.add_related_file(l_0_3)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
