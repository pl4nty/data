-- Threat: !InfrastructureShared
-- Name: 908d3de13731
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SkypeCap.B")
  return mp.INFECTED
end
return mp.LOWFI
