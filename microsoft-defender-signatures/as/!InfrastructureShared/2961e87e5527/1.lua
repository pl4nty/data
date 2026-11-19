-- Threat: !InfrastructureShared
-- Name: 2961e87e5527
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 1 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
if l_0_2 == "InitiateTheAttack" then
  return mp.INFECTED
end
return mp.CLEAN
