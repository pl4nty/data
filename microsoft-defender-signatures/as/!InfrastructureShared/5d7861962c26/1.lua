-- Threat: !InfrastructureShared
-- Name: 5d7861962c26
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 3 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[3].namerva, 64)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if l_0_2 ~= "psinlineworker" then
  return mp.CLEAN
end
local l_0_3 = pe.get_versioninfo()
if l_0_3.OriginalFilename ~= "hostfxr.dll" then
  return mp.CLEAN
end
return mp.INFECTED
