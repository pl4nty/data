-- Threat: !InfrastructureShared
-- Name: c578719c8a80
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 1 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
if l_0_2 ~= "ProcessMain" then
  return mp.CLEAN
end
return mp.INFECTED
