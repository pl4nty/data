-- Threat: !InfrastructureShared
-- Name: c8b3891c667f
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  if string.find(l_0_0, "/download", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
