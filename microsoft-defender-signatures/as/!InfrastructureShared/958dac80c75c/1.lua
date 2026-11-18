-- Threat: !InfrastructureShared
-- Name: 958dac80c75c
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacBooster.B")
  return mp.INFECTED
end
return mp.LOWFI
