-- Threat: !InfrastructureShared
-- Name: 3e78ad145dd3
-- Type: 21

if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 3 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[3].namerva, 64)
l_0_2 = string.lower(l_0_2)
if l_0_2 ~= "madtraceprocess" then
  return mp.CLEAN
end
return mp.INFECTED
