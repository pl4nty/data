-- Threat: !InfrastructureShared
-- Name: 2078b5a8b6fc
-- Type: 21

local l_0_0 = pe.get_exports_count()
local l_0_1 = mp.getfilesize()
if peattributes.isdll and 4 < l_0_0 and l_0_0 < 11 and 30000 < l_0_1 and l_0_1 < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
