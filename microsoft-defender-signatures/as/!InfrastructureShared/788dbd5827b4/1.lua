-- Threat: !InfrastructureShared
-- Name: 788dbd5827b4
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacReviver.F")
  return mp.INFECTED
end
return mp.LOWFI
