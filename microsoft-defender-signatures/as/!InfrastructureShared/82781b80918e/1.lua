-- Threat: !InfrastructureShared
-- Name: 82781b80918e
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 6279 then
  return mp.INFECTED
end
return mp.CLEAN
