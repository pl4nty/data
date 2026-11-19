-- Threat: !InfrastructureShared
-- Name: 179785dc8be89
-- Type: 21

if peattributes.is_exe == false then
  return mp.CLEAN
end
if 0 == pe.query_import(pe.IMPORT_STATIC, 2430426247) then
  return mp.CLEAN
end
if 0 == pe.query_import(pe.IMPORT_STATIC, 4186436034) then
  return mp.CLEAN
end
return mp.INFECTED
