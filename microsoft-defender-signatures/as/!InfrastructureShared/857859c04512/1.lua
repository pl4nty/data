-- Threat: !InfrastructureShared
-- Name: 857859c04512
-- Type: 21

if peattributes.isdll == false or peattributes.hasexports == false then
  return mp.CLEAN
end
local l_0_0 = pe.get_exports()
if 90 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
