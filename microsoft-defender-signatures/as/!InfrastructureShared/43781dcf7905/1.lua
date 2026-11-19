-- Threat: !InfrastructureShared
-- Name: 43781dcf7905
-- Type: 21

if 0 == pe.query_import(pe.IMPORT_STATIC, 1000219088) then
  return mp.CLEAN
end
if 0 == pe.query_import(pe.IMPORT_STATIC, 1830286805) then
  return mp.CLEAN
end
return mp.INFECTED
