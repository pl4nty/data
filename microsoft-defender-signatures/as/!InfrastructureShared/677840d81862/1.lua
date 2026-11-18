-- Threat: !InfrastructureShared
-- Name: 677840d81862
-- Type: 21

if peattributes.isdll == false or pehdr.AddressOfEntryPoint ~= 0 or peattributes.hasexports == false then
  return mp.CLEAN
end
local l_0_0 = pe.get_exports()
if 35 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
