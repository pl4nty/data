-- Threat: !InfrastructureShared
-- Name: 3178b699d5bc
-- Type: 21

if 0 == pe.query_import(pe.IMPORT_STATIC, 823159601) or 0 == pe.query_import(pe.IMPORT_STATIC, 680197589) then
  return mp.CLEAN
end
return mp.INFECTED
