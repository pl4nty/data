-- Threat: !InfrastructureShared
-- Name: 7bb31a6ad616
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if sysio.IsFileExists(l_0_3) then
    bm.add_related_file(l_0_3)
  end
end
return mp.INFECTED
