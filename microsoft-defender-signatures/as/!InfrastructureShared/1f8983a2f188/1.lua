-- Threat: !InfrastructureShared
-- Name: 1f8983a2f188
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_timestamp then
  return mp.CLEAN
end
return mp.INFECTED
