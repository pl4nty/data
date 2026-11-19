-- Threat: !InfrastructureShared
-- Name: 6778b48f39cf
-- Type: 21

if pe.query_import(pe.IMPORT_STATIC, 3253775783) == 0 then
  return mp.CLEAN
end
return mp.INFECTED
