-- Threat: !InfrastructureShared
-- Name: 7a8dd73860e5
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AweCleaner.D")
  return mp.INFECTED
end
return mp.LOWFI
