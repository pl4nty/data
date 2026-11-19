-- Threat: !InfrastructureShared
-- Name: c38d26cbf551
-- Type: 21

if mp.HSTR_WEIGHT >= 22 then
  mp.set_mpattribute("PUA:Block:InstallCore.C")
  return mp.INFECTED
end
return mp.LOWFI
