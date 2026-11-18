-- Threat: !InfrastructureShared
-- Name: 1d89ee58f9ef
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.suspicious_timestamp then
  return mp.CLEAN
end
return mp.INFECTED
