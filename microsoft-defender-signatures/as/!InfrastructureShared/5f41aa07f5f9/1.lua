-- Threat: !InfrastructureShared
-- Name: 5f41aa07f5f9
-- Type: 21

local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = #l_0_0
if l_0_1 < 48 then
  return mp.CLEAN
end
local l_0_2 = 16432
local l_0_3 = mp.bswap32(mp.readu_u32(l_0_0, 21))
if mp.bitand(l_0_3, l_0_2) == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
