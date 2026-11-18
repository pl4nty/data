-- Threat: !InfrastructureShared
-- Name: bc8d5384aa31
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Anykeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
