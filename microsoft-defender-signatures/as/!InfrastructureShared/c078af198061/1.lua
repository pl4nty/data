-- Threat: !InfrastructureShared
-- Name: c078af198061
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 1 then
  return mp.INFECTED
end
return mp.CLEAN
