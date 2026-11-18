-- Threat: !InfrastructureShared
-- Name: 6761e7c69af3
-- Type: 21

if pe.query_import(pe.IMPORT_STATIC, 2509834678) ~= 0 and pe.query_import(pe.IMPORT_STATIC, 4149123677) ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN
