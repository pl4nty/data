-- Threat: !InfrastructureShared
-- Name: c98df89c6447
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacBooster.A")
  return mp.INFECTED
end
return mp.LOWFI
