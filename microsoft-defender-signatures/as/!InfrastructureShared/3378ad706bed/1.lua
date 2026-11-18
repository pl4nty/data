-- Threat: !InfrastructureShared
-- Name: 3378ad706bed
-- Type: 21

if peattributes.isdll then
  local l_0_0 = mp.getfilesize()
  if 5447680 < l_0_0 and l_0_0 < 7290880 and pe.query_import(pe.IMPORT_STATIC, 3164448353) ~= 0 and pe.query_import(pe.IMPORT_STATIC, 2744197095) ~= 0 and pe.query_import(pe.IMPORT_STATIC, 2717511079) ~= 0 and pe.query_import(pe.IMPORT_STATIC, 537135066) ~= 0 and pe.query_import(pe.IMPORT_STATIC, 3293213921) ~= 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
