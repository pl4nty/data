-- Threat: !InfrastructureShared
-- Name: b68d27424d5c
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AdloadMuda.A")
  return mp.INFECTED
end
return mp.LOWFI
