-- Threat: !InfrastructureShared
-- Name: 488df975ce73
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Amcleaner.D")
  return mp.INFECTED
end
return mp.LOWFI
