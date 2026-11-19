-- Threat: !InfrastructureShared
-- Name: 8c8dbc083471
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  mp.set_mpattribute("PUA:Block:Conduit.B")
  return mp.INFECTED
end
return mp.LOWFI
