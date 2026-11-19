-- Threat: !InfrastructureShared
-- Name: ed8de98add6d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.G")
  return mp.INFECTED
end
return mp.LOWFI
