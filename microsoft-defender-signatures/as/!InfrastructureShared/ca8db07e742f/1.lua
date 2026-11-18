-- Threat: !InfrastructureShared
-- Name: ca8db07e742f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AdvMacCleaner.B")
  return mp.INFECTED
end
return mp.LOWFI
