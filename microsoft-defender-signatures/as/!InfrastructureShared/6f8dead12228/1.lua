-- Threat: !InfrastructureShared
-- Name: 6f8dead12228
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:SkypeCap.C")
  return mp.INFECTED
end
return mp.LOWFI
