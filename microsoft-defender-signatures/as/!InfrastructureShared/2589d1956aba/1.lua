-- Threat: !InfrastructureShared
-- Name: 2589d1956aba
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_timestamp then
  return mp.CLEAN
end
return mp.INFECTED
