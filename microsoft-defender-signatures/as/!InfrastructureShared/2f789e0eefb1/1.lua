-- Threat: !InfrastructureShared
-- Name: 2f789e0eefb1
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 2 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[2].namerva, 64)
if l_0_2 ~= "CorBindToRuntimeEx" then
  return mp.CLEAN
end
return mp.INFECTED
