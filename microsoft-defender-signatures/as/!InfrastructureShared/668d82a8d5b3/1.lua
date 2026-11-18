-- Threat: !InfrastructureShared
-- Name: 668d82a8d5b3
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Pirrit.A")
  return mp.INFECTED
end
return mp.LOWFI
