-- Threat: !InfrastructureShared
-- Name: 41b3492439a1
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  if l_0_1 ~= nil then
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
      if sysio.IsFileExists(l_0_4) == true then
        bm.add_related_file(l_0_4)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
