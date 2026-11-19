-- Threat: !InfrastructureShared
-- Name: 638d38d153a4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.F")
  return mp.INFECTED
end
return mp.LOWFI
