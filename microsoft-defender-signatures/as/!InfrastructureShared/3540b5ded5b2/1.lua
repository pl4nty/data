-- Threat: !InfrastructureShared
-- Name: 3540b5ded5b2
-- Type: 21

local l_0_0
local l_0_1 = nri.IsResponse()
local l_0_2 = 16
if l_0_1 then
  l_0_0 = nri.GetRawResponseBlob()
else
  l_0_0 = nri.GetRawRequestBlob()
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6 = MpCommon.BinaryRegExpSearch("(...)\252SMB(....)[\001\002\003\004]...(....)", l_0_0)
if not l_0_3 then
  return mp.CLEAN
end

function readu32(l_1_0, l_1_1)
  local l_1_2, l_1_3, l_1_4, l_1_5
  l_1_2 = string.byte(l_1_0, l_1_1)
  l_1_3 = string.byte(l_1_0, l_1_1 + 1)
  l_1_4 = string.byte(l_1_0, l_1_1 + 2)
  l_1_5 = string.byte(l_1_0, l_1_1 + 3)
  return l_1_2 + l_1_3 * 256 + l_1_4 * 65536 + l_1_5 * 16777216
end

l_0_4 = mp.bitand(string.byte(l_0_4, 1), 1) * 65536 + string.byte(l_0_4, 2) * 256 + string.byte(l_0_4, 3)
l_0_5 = readu32(l_0_5, 1)
l_0_6 = readu32(l_0_6, 1)
if l_0_5 > 4294967295 - l_0_6 then
  return mp.INFECTED
end
if l_0_2 < l_0_4 and l_0_6 > l_0_4 - l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
