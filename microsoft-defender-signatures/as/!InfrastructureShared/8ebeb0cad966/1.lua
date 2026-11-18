-- Threat: !InfrastructureShared
-- Name: 8ebeb0cad966
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Ewind.B")
  return mp.INFECTED
end
return mp.LOWFI
