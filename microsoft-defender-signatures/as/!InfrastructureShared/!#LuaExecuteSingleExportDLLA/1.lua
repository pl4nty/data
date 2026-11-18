-- Threat: !InfrastructureShared
-- Name: !#Lua:ExecuteSingleExportDLL.A
-- Type: 9

if not peattributes.isdll or peattributes.no_exports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 1 then
  return mp.CLEAN
end
if l_0_1[1].ordinal ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED
