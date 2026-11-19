-- Threat: !InfrastructureShared
-- Name: 78be6c3b47c9
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Autoins.C")
  return mp.INFECTED
end
return mp.LOWFI
