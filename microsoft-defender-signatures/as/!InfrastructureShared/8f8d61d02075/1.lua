-- Threat: !InfrastructureShared
-- Name: 8f8d61d02075
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.E")
  return mp.INFECTED
end
return mp.LOWFI
