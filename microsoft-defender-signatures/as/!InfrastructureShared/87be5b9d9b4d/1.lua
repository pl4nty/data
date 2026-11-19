-- Threat: !InfrastructureShared
-- Name: 87be5b9d9b4d
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Domob.A")
  return mp.INFECTED
end
return mp.LOWFI
