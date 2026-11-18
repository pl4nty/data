-- Threat: !InfrastructureShared
-- Name: 508d641a0077
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Awecleaner.B")
  return mp.INFECTED
end
return mp.LOWFI
