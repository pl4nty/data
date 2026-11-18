-- Threat: !InfrastructureShared
-- Name: 17fb38ab863bf
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = mp.CLEAN
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = true
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = true
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 == true then
    l_0_0 = l_0_3[1]
    if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) and string.match(l_0_0, "\\[^\\]+[:][^\\]+%.%a") ~= nil then
      l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  else
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if sysio.IsFileExists(l_0_5) and string.find(l_0_5, "\\[^\\]+[:][^\\]+%.%a") ~= nil then
        l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_5)
        bm.add_related_file(l_0_0)
        l_0_2 = mp.INFECTED
      end
    end
  end
end
if l_0_2 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
