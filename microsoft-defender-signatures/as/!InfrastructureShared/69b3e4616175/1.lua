-- Threat: !InfrastructureShared
-- Name: 69b3e4616175
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
  if string.find(l_0_0, "/format:", 1, true) ~= nil then
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN
