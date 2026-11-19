-- Threat: !InfrastructureShared
-- Name: 618dc275c6f5
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Jawego.A")
  return mp.INFECTED
end
return mp.LOWFI
