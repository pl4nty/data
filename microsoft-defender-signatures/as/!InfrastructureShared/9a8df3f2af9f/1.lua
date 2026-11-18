-- Threat: !InfrastructureShared
-- Name: 9a8df3f2af9f
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:SkypeCap.A")
  return mp.INFECTED
end
return mp.LOWFI
