-- Threat: !InfrastructureShared
-- Name: 758d134d9fde
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Refog.E")
  return mp.INFECTED
end
return mp.LOWFI
