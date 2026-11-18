-- Threat: !InfrastructureShared
-- Name: 6a411e5c784e
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
local l_0_1, l_0_2, l_0_3 = MpCommon.BinaryRegExpSearch("([\\x00-\\xFF]+)\\x05\\x00\\x00\\x03\\x10\\x00\\x00\\x00(..)...\\x00\\x00\\x00....\\x00\\x00\\x04\\x00", l_0_0)
if l_0_1 and l_0_3 then
  local l_0_4 = mp.readu_u16(l_0_3, 1)
  local l_0_5 = string.sub(l_0_0, #l_0_2 + 1, #l_0_2 + l_0_4)
  local l_0_6 = MpCommon.BinaryRegExpSearch("\\x0A\\x06..\\x7F\\x35\\x01\\x00", l_0_5)
  if l_0_6 then
    return mp.INFECTED
  end
end
return mp.CLEAN
