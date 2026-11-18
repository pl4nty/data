-- Threat: !InfrastructureShared
-- Name: 668d3c9dd92a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Jawego.F")
  return mp.INFECTED
end
return mp.LOWFI
