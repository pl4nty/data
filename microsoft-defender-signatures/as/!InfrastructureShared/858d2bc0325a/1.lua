-- Threat: !InfrastructureShared
-- Name: 858d2bc0325a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:ClearDisk.A")
  return mp.INFECTED
end
return mp.LOWFI
