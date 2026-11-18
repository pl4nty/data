-- Threat: !InfrastructureShared
-- Name: c18d59c2cef4
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.P!xp")
  return mp.INFECTED
end
return mp.LOWFI
