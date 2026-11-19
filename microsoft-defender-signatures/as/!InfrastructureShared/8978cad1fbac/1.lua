-- Threat: !InfrastructureShared
-- Name: 8978cad1fbac
-- Type: 21

if peattributes.isdll == false or pehdr.AddressOfEntryPoint ~= 0 or peattributes.hasexports == false then
  return mp.CLEAN
end
local l_0_0 = pe.get_exports()
if 100 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
