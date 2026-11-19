-- Threat: !InfrastructureShared
-- Name: 6c8d8725c6e5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Jawego.B")
  return mp.INFECTED
end
return mp.LOWFI
