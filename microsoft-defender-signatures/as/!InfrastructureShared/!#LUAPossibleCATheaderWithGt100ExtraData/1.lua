-- Threat: !InfrastructureShared
-- Name: !#LUA:PossibleCATheaderWithGt100ExtraData
-- Type: 12

if mp.readu_u16(headerpage, 1) ~= 33328 then
  return mp.CLEAN
end
local l_0_0 = headerpage[3] * 256
l_0_0 = l_0_0 + headerpage[4] + 4
if l_0_0 < 256 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_0 >= l_0_1 then
  return mp.CLEAN
end
if l_0_1 - l_0_0 < 256 then
  return mp.CLEAN
end
return mp.INFECTED
