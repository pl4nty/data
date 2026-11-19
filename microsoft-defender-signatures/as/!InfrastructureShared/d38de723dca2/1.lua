-- Threat: !InfrastructureShared
-- Name: d38de723dca2
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacFileOpener.A")
  return mp.INFECTED
end
return mp.LOWFI
