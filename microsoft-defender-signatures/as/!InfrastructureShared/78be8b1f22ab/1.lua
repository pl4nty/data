-- Threat: !InfrastructureShared
-- Name: 78be8b1f22ab
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Rooter.C")
  return mp.INFECTED
end
return mp.LOWFI
