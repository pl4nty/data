-- Threat: !InfrastructureShared
-- Name: b7becd2aad74
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Fyben.B")
  return mp.INFECTED
end
return mp.LOWFI
