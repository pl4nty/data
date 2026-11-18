-- Threat: !InfrastructureShared
-- Name: 68782e29c000
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.hasappendeddata then
  return mp.CLEAN
end
return mp.INFECTED
