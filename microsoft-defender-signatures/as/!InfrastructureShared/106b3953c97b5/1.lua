-- Threat: !InfrastructureShared
-- Name: 106b3953c97b5
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
local l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p2)
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  if not l_0_1:find(l_0_0) then
    return mp.CLEAN
  end
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
