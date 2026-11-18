-- Threat: !InfrastructureShared
-- Name: a978b3708706
-- Type: 21

local l_0_0 = pe.query_import(pe.IMPORT_STATIC, 3604202544)
local l_0_1 = pe.query_import(pe.IMPORT_STATIC, 1712054030)
local l_0_2 = pe.query_import(pe.IMPORT_STATIC, 3310839974)
if l_0_0 == 0 or l_0_1 == 0 or l_0_2 == 0 then
  return mp.CLEAN
end
return mp.INFECTED
