-- Threat: !InfrastructureShared
-- Name: 5d78fe505945
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 45 then
  return mp.INFECTED
end
return mp.CLEAN
