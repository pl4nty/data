-- Threat: !InfrastructureShared
-- Name: 688d08f5e691
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:GT32SupportGeeks.A")
  return mp.INFECTED
end
return mp.LOWFI
