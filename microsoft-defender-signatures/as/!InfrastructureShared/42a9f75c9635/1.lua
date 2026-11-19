-- Threat: !InfrastructureShared
-- Name: 42a9f75c9635
-- Type: 21

local l_0_0 = 0
local l_0_1 = 0
local l_0_2 = {}
local l_0_3 = nri.GetConnectionHistory()
for l_0_4, l_0_5 in pairs(l_0_3) do
  if l_0_5.DestinationPort == 3389 then
    if l_0_2[l_0_5.DestinationAddressLow] == nil then
      l_0_2[l_0_5.DestinationAddressLow] = 1
      l_0_1 = l_0_1 + 1
    end
    l_0_0 = l_0_0 + 1
  end
end
if 5 < l_0_1 or 10 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
