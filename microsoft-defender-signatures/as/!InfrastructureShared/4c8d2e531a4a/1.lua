-- Threat: !InfrastructureShared
-- Name: 4c8d2e531a4a
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:RefogKeylogger")
  return mp.INFECTED
end
return mp.LOWFI
