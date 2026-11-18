-- Threat: !InfrastructureShared
-- Name: b18de8a006cd
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.C!xp")
  return mp.INFECTED
end
return mp.LOWFI
