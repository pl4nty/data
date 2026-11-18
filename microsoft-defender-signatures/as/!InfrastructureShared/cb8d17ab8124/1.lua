-- Threat: !InfrastructureShared
-- Name: cb8d17ab8124
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:TuguuInstaller.A")
  return mp.INFECTED
end
return mp.LOWFI
