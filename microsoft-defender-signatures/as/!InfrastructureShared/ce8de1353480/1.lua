-- Threat: !InfrastructureShared
-- Name: ce8de1353480
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Convuster.C")
  return mp.INFECTED
end
return mp.LOWFI
