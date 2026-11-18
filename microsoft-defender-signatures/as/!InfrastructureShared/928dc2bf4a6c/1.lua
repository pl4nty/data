-- Threat: !InfrastructureShared
-- Name: 928dc2bf4a6c
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:GT32SupportGeeks.B")
  return mp.INFECTED
end
return mp.LOWFI
