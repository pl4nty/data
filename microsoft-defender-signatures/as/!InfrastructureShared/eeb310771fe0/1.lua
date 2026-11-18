-- Threat: !InfrastructureShared
-- Name: eeb310771fe0
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
local l_0_4
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[9].utf8p2
end
if l_0_4 ~= nil then
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
    if sysio.IsFileExists(l_0_7) == true then
      bm.add_related_file(l_0_7)
    end
  end
end
return mp.INFECTED
