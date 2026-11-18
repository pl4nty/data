-- Threat: !InfrastructureShared
-- Name: 62be1d123187
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CerbMon.A")
  return mp.INFECTED
end
return mp.LOWFI
