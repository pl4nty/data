-- Threat: !InfrastructureShared
-- Name: 3b78fccce75b
-- Type: 21

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_2 = {
  ExecutePatch = 1,
  ["Main@12"] = 1,
  MakeUuid = 1,
  kAiCode = 1
}
local l_0_3 = 0
for l_0_4 = 1, l_0_0 do
  local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
  if l_0_2[l_0_5] then
    l_0_3 = l_0_3 + l_0_2[l_0_5]
  end
end
if l_0_3 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
