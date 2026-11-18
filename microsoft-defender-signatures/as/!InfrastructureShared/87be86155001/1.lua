-- Threat: !InfrastructureShared
-- Name: 87be86155001
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Domob.A")
  return mp.INFECTED
end
return mp.LOWFI
