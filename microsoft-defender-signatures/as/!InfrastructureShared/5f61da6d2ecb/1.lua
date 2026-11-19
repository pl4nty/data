-- Threat: !InfrastructureShared
-- Name: 5f61da6d2ecb
-- Type: 21

if peattributes.isexe ~= true then
  return mp.CLEAN
end
local l_0_0 = pe.query_import(pe.IMPORT_STATIC, 2742131283)
local l_0_1 = pe.query_import(pe.IMPORT_STATIC, 4114023533)
local l_0_2 = pe.query_import(pe.IMPORT_STATIC, 1591092167)
if (l_0_0 or l_0_1) and l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
