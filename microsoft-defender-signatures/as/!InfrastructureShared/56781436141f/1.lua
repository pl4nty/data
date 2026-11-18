-- Threat: !InfrastructureShared
-- Name: 56781436141f
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0 = {
  SUUAFindUser = "",
  SUUAGetAttribute = "",
  SUUASetAttribute = "",
  SUUAEnumDirAccess = ""
}
local l_0_1 = 0
local l_0_2, l_0_3 = pe.get_exports()
if l_0_2 < 4 then
  return mp.CLEAN
end
for l_0_4 = 1, l_0_2 do
  local l_0_5 = pe.mmap_string_rva(l_0_3[l_0_4].namerva, 64)
  if l_0_0[l_0_5] then
    l_0_1 = l_0_1 + 1
  end
end
if l_0_1 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
