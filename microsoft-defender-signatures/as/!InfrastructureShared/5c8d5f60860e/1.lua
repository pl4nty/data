-- Threat: !InfrastructureShared
-- Name: 5c8d5f60860e
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Skypelogger.C")
  return mp.INFECTED
end
return mp.LOWFI
