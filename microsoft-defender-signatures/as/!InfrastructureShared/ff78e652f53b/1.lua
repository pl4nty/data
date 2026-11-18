-- Threat: !InfrastructureShared
-- Name: ff78e652f53b
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("HSTR:Yalogger")
end
return mp.CLEAN
