-- Threat: !InfrastructureShared
-- Name: 6f78a62afb34
-- Type: 21

if not peattributes.isexe and not peattributes.isvbpcode then
  return mp.CLEAN
end
return mp.INFECTED
