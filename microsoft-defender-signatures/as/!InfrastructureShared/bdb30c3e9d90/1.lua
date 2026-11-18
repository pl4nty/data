-- Threat: !InfrastructureShared
-- Name: bdb30c3e9d90
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1:lower():match("\\amsi\\providers\\({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})")
local l_0_1 = this_sigattrlog[2].utf8p1:lower()
local l_0_2 = this_sigattrlog[2].utf8p2:lower()
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_2 ~= nil and l_0_1:find(l_0_0, 1, true) then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
