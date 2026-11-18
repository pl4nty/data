-- Threat: !InfrastructureShared
-- Name: 5e788b10f4da
-- Type: 21

if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 3 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
l_0_2 = string.lower(l_0_2)
if l_0_2 ~= "dllinstall" then
  return mp.CLEAN
end
return mp.INFECTED
