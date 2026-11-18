-- Threat: !InfrastructureShared
-- Name: 9cb36c2114d1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if isnull(l_0_0) or string.len(l_0_0) == 0 then
  return mp.CLEAN
end
for l_0_1 in l_0_0:gmatch("([^\r\n]*)\n?") do
  local l_0_2, l_0_3 = pcall(mp.ContextualExpandEnvironmentVariables, l_0_1)
  if l_0_2 and l_0_3 and sysio.IsFileExists(l_0_3) then
    bm.add_related_file(l_0_3)
  end
end
return mp.INFECTED
