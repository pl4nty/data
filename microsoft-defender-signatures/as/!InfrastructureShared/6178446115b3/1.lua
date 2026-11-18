-- Threat: !InfrastructureShared
-- Name: 6178446115b3
-- Type: 21

local l_0_0 = -1
if pesecs[3].Name == ".data" then
  l_0_0 = 3
end
if pesecs[2].Name == ".data" then
  l_0_0 = 2
end
if l_0_0 == -1 then
  return mp.CLEAN
end
if pesecs[l_0_0].SizeOfRawData > 4096 then
  local l_0_1 = pehdr.ImageBase + pesecs[l_0_0].VirtualAddress + 16
  local l_0_2 = pe.mmap_va(l_0_1, 16)
  local l_0_3 = string.byte(l_0_2, 1)
  local l_0_4 = string.byte(l_0_2, 2)
  if l_0_3 == 77 and l_0_4 == 90 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
