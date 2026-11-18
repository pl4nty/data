-- Threat: !InfrastructureShared
-- Name: 7b8db9c16798
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacBooster.E")
  return mp.INFECTED
end
return mp.LOWFI
