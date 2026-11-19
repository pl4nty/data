-- Threat: !InfrastructureShared
-- Name: 8f8d5894faa5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Conduit.D")
  return mp.INFECTED
end
return mp.LOWFI
