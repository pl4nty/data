-- Threat: !InfrastructureShared
-- Name: 97782d58d2e2
-- Type: 21
-- Flags: 1

if peattributes.ismsil and mp.get_mpattribute("LUA:FileSizeLE5000.A") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
