-- Threat: !InfrastructureShared
-- Name: 778df37c358b
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Jawego.C")
  return mp.INFECTED
end
return mp.LOWFI
