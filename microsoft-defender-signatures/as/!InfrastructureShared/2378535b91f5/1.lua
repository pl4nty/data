-- Threat: !InfrastructureShared
-- Name: 2378535b91f5
-- Type: 21

local l_0_0, l_0_1 = pe.get_exports()
if 5 <= l_0_0 then
  return mp.CLEAN
end
local l_0_2 = "CreateWindowServerTime"
for l_0_3 = 1, l_0_0 do
  local l_0_4 = pe.mmap_string_rva(l_0_1[l_0_3].namerva, 64)
  if l_0_2 == l_0_4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
