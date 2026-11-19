-- Threat: !InfrastructureShared
-- Name: 738dbfc5a1d3
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:FileOpener.A")
  return mp.INFECTED
end
return mp.LOWFI
