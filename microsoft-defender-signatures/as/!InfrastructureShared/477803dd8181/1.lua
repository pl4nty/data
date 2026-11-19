-- Threat: !InfrastructureShared
-- Name: 477803dd8181
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
