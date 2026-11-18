-- Threat: !InfrastructureShared
-- Name: 4ab3a805b9f3
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = "remote_file_created_taint"
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if not l_0_2 or not l_0_1 then
  return mp.CLEAN
end
local l_0_3
local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
for l_0_5, l_0_6 in ipairs(l_0_4) do
  l_0_3 = string.match(l_0_6, "/([^/]+)$")
  l_0_3 = l_0_3 or l_0_6
  if IsKeyInRollingQueue(l_0_0, l_0_3, false) and not isTainted(l_0_1, l_0_0) then
    taint(l_0_1, l_0_0, 3600)
    return mp.CLEAN
  end
end
return mp.CLEAN
