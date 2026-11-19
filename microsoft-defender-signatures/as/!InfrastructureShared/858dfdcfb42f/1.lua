-- Threat: !InfrastructureShared
-- Name: 858dfdcfb42f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.W")
  return mp.INFECTED
end
return mp.LOWFI
