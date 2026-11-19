-- Threat: !InfrastructureShared
-- Name: 6c8d33d40b69
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Ulbi.A")
  return mp.INFECTED
end
return mp.LOWFI
