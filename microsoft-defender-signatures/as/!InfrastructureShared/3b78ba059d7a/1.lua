-- Threat: !InfrastructureShared
-- Name: 3b78ba059d7a
-- Type: 21

local function l_0_0(l_1_0)
  if l_1_0 == nil then
    return
  end
  for l_1_1 = 1, pehdr.NumberOfSections do
    if tostring(pesecs[l_1_1].Name) == l_1_0 then
      return pesecs[l_1_1].VirtualAddress, pesecs[l_1_1].VirtualSize
    end
  end
end

local l_0_1, l_0_2 = l_0_0(".rsrc")
local l_0_3 = pehdr.ImageBase
local l_0_4 = hstrlog[1].VA
if l_0_1 ~= nil and l_0_2 ~= nil and l_0_3 ~= nil and l_0_4 ~= nil then
  local l_0_5 = l_0_3 + l_0_1
  local l_0_6 = l_0_5 + l_0_2
  if l_0_4 >= l_0_5 and l_0_4 <= l_0_6 then
    mp.set_mpattribute("HSTR:EmbeddedXorPeFileInResource.A")
  end
end
mp.set_mpattribute("HSTR:EmbeddedXorPeFile.A")
return mp.INFECTED
