-- Threat: !InfrastructureShared
-- Name: ff782b2e262d
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.readfile(84, 2)
if l_0_0 ~= nil and l_0_0 == 523 then
  return mp.INFECTED
end
return mp.CLEAN
