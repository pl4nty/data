-- Threat: !InfrastructureShared
-- Name: 848d4ca39f44
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.L")
  return mp.INFECTED
end
return mp.LOWFI
