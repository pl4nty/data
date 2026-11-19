-- Threat: !InfrastructureShared
-- Name: 8d8d47fed05c
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Awecleaner.C")
  return mp.INFECTED
end
return mp.LOWFI
