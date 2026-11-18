-- Threat: !InfrastructureShared
-- Name: a7b3b75b4832
-- Type: 21

local l_0_0
local l_0_1 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      l_0_1 = true
      bm.add_related_file(l_0_4)
    end
  end
end
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
