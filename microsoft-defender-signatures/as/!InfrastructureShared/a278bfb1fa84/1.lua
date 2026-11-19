-- Threat: !InfrastructureShared
-- Name: a278bfb1fa84
-- Type: 21

if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 7 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[2].namerva, 64)
l_0_2 = string.lower(l_0_2)
if l_0_2 ~= "executedecryptedshellcode" then
  return mp.CLEAN
end
return mp.INFECTED
