-- Threat: !InfrastructureShared
-- Name: 6241ed73c640
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.len(l_0_0)
if l_0_1 < 8 then
  return mp.CLEAN
end
if 1048576 < l_0_1 then
  return mp.CLEAN
end
if string.sub(l_0_0, 1, 4) ~= "CSB1" then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5 = string.byte(l_0_0, 5, 8)
local l_0_6 = l_0_2 * 16777216 + l_0_3 * 65536 + l_0_4 * 256 + l_0_5
if l_0_6 < 40 or 1048576 < l_0_6 then
  return mp.CLEAN
end
local l_0_7 = string.sub(l_0_0, 9)
if string.len(l_0_7) ~= l_0_6 then
  return mp.CLEAN
end
if l_0_6 % 4 ~= 0 then
  return mp.CLEAN
end
local l_0_8 = string.match(l_0_7, "^[A-Za-z0-9+/]+$")
l_0_8 = l_0_8 or string.match(l_0_7, "^[A-Za-z0-9+/]+=$")
l_0_8 = l_0_8 or string.match(l_0_7, "^[A-Za-z0-9+/]+==$")
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {
  CyberStrikeAI_Frame = "CSB1_length_prefixed_base64"
}
nri.AddTelemetry(0, l_0_9)
return mp.INFECTED
