-- Threat: !InfrastructureShared
-- Name: 8b8dbc920e6a
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Jawego.E")
  return mp.INFECTED
end
return mp.LOWFI
