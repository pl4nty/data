-- Threat: !InfrastructureShared
-- Name: 748d676cf151
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:LogKext.A")
  return mp.INFECTED
end
return mp.LOWFI
