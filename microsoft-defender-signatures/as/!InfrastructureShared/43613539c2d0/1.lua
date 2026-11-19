-- Threat: !InfrastructureShared
-- Name: 43613539c2d0
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 1 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
if l_0_2 == "main" then
  return mp.INFECTED
end
return mp.CLEAN
