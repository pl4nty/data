-- Threat: !InfrastructureShared
-- Name: a178170634ef
-- Type: 21

if peattributes.isexe and pe.query_import(pe.IMPORT_STATIC, 2269433638) then
  return mp.INFECTED
end
return mp.CLEAN
