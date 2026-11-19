-- Threat: !InfrastructureShared
-- Name: 7c8d3ce1cecc
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Tunenup.A")
  return mp.INFECTED
end
return mp.LOWFI
