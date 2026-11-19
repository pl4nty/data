-- Threat: !InfrastructureShared
-- Name: 787846722bc3
-- Type: 21

if mp.get_mpattribute("SIGATTR:PUA:SoftCnapp") then
  return mp.INFECTED
end
return mp.CLEAN
