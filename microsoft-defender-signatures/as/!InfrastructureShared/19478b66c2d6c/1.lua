-- Threat: !InfrastructureShared
-- Name: 19478b66c2d6c
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.isvbnative then
  return mp.CLEAN
end
return mp.INFECTED
