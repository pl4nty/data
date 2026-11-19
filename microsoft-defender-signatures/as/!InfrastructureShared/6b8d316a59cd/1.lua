-- Threat: !InfrastructureShared
-- Name: 6b8d316a59cd
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Spykeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
