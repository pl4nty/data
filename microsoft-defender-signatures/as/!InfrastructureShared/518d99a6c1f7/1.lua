-- Threat: !InfrastructureShared
-- Name: 518d99a6c1f7
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:LogKext.C")
  return mp.INFECTED
end
return mp.LOWFI
