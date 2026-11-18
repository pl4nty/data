-- Threat: !InfrastructureShared
-- Name: bc78fa810462
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 1 then
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "RegisterModule" then
    return mp.INFECTED
  end
end
return mp.CLEAN
