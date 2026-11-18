-- Threat: !InfrastructureShared
-- Name: 2178424e98d2
-- Type: 21

if mp.get_mpattribute("Packed:Confuser") then
  return mp.INFECTED
end
return mp.CLEAN
