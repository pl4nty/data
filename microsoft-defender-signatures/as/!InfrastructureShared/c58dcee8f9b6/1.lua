-- Threat: !InfrastructureShared
-- Name: c58dcee8f9b6
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:TuguuInstaller.B")
  return mp.INFECTED
end
return mp.LOWFI
