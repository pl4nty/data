-- Threat: !InfrastructureShared
-- Name: 55b36e9021a0
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_2 = {}
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
    table.insert(l_0_2, l_0_0)
    MpCommon.SetPersistContextNoPath("ServiceCreationScript", l_0_2, 100)
  end
  if l_0_1 ~= nil then
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_1)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) == true then
        bm.add_related_file(l_0_5)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
