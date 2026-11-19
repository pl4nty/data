-- Threat: !InfrastructureShared
-- Name: b978a6f134b7
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
