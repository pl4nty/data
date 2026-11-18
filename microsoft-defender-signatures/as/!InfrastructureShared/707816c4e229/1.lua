-- Threat: !InfrastructureShared
-- Name: 707816c4e229
-- Type: 21

local l_0_0
for l_0_1 = pehdr.NumberOfSections, 1, -1 do
  if pesecs[l_0_1].Name == ".data" then
    l_0_0 = l_0_1
    break
  end
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = pesecs[l_0_0].PointerToRawData
local l_0_3 = pesecs[l_0_0].SizeOfRawData
local l_0_4 = {}
if hstrlog[1].VA_all then
  table.insert(l_0_4, hstrlog[1].VA_all)
end
if hstrlog[2].VA_all then
  table.insert(l_0_4, hstrlog[2].VA_all)
end
if hstrlog[3].VA_all then
  table.insert(l_0_4, hstrlog[3].VA_all)
end
if hstrlog[4].VA_all then
  table.insert(l_0_4, hstrlog[4].VA_all)
end
if hstrlog[5].VA_all then
  table.insert(l_0_4, hstrlog[5].VA_all)
end
if hstrlog[6].VA_all then
  table.insert(l_0_4, hstrlog[6].VA_all)
end
for l_0_5, l_0_6 in ipairs(l_0_4) do
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    if l_0_8 > l_0_2 and l_0_8 < l_0_2 + l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
