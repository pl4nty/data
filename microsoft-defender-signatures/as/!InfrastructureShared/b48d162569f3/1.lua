-- Threat: !InfrastructureShared
-- Name: b48d162569f3
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.E!xp")
  return mp.INFECTED
end
return mp.LOWFI
