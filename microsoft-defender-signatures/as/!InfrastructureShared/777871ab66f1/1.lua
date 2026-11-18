-- Threat: !InfrastructureShared
-- Name: 777871ab66f1
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
