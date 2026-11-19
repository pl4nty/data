-- Threat: !InfrastructureShared
-- Name: 22611b40ff80
-- Type: 21

local l_0_0 = pehdr.ImageBase + pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA
if l_0_0 <= 0 then
  return mp.CLEAN
end
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size
local l_0_2 = hstrlog[1].VA
if l_0_0 < l_0_2 and l_0_2 < l_0_0 + l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
