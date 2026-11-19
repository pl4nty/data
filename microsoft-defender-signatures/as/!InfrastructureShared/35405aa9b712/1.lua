-- Threat: !InfrastructureShared
-- Name: 35405aa9b712
-- Type: 21

local l_0_0
local l_0_1 = nri.IsResponse()
if l_0_1 then
  l_0_0 = nri.GetRawResponseBlob()
else
  l_0_0 = nri.GetRawRequestBlob()
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = MpCommon.BinaryRegExpSearch("(....)........\220\a\000\000(....).", l_0_0)
if not l_0_2 then
  return mp.CLEAN
end

local function l_0_5(l_1_0, l_1_1)
  local l_1_2 = string.byte(l_1_0, l_1_1)
  local l_1_3 = string.byte(l_1_0, l_1_1 + 1)
  local l_1_4 = string.byte(l_1_0, l_1_1 + 2)
  local l_1_5 = string.byte(l_1_0, l_1_1 + 3)
  if not (l_1_2 and l_1_3 and l_1_4) or not l_1_5 then
    return 0
  end
  return l_1_2 + l_1_3 * 256 + l_1_4 * 65536 + l_1_5 * 16777216
end

local l_0_6 = l_0_5(l_0_3, 1)
local l_0_7 = l_0_5(l_0_4, 1)
if 50000 < l_0_7 and 0 < l_0_6 and l_0_6 < 2048 then
  return mp.INFECTED
end
if 0 < l_0_6 and l_0_7 > l_0_6 * 8 then
  return mp.INFECTED
end
return mp.CLEAN
