-- Threat: !InfrastructureShared
-- Name: 67786a4f15e5
-- Type: 21

if not peattributes.isdll or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if 8 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3 = 1, l_0_0 do
  local l_0_4 = pe.mmap_string_rva(l_0_1[l_0_3].namerva, 64)
  if l_0_4 == "Open" then
    l_0_2 = l_0_2 + 1
  end
  if l_0_4 == "Close" then
    l_0_2 = l_0_2 + 1
  end
end
if l_0_2 < 2 then
  return mp.CLEAN
end
return mp.INFECTED
