-- Threat: !InfrastructureShared
-- Name: 99b3a2c78beb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
  if string.find(l_0_0, "/format:", 1, true) ~= nil then
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN
