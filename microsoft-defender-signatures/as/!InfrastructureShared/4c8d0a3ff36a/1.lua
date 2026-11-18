-- Threat: !InfrastructureShared
-- Name: 4c8d0a3ff36a
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CpuMeaner.A")
  return mp.INFECTED
end
return mp.LOWFI
