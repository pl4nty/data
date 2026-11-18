-- Threat: !InfrastructureShared
-- Name: 357f287fcae0
-- Type: 21

local l_0_0 = mp.crc32(-1, epcode, 1, 15)
if 0 ~= pe.query_import(pe.IMPORT_STATIC, 1589549540) and l_0_0 == 183454422 then
  return mp.INFECTED
end
return mp.CLEAN
