-- Threat: !InfrastructureShared
-- Name: 8b8d561ca3ac
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:MacTweaker.A")
  return mp.INFECTED
end
return mp.LOWFI
