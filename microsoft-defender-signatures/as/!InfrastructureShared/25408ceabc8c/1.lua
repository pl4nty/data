-- Threat: !InfrastructureShared
-- Name: 25408ceabc8c
-- Type: 21

if not nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetRawResponseBlob()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.BinaryRegExpSearch("InvalidBSON", l_0_0)
local l_0_2 = MpCommon.BinaryRegExpSearch("unrecognized type", l_0_0)
local l_0_3 = MpCommon.BinaryRegExpSearch("field name '%c?[%z-\255][%z-\255][%z-\255][%z-\255][%z-\255]+'", l_0_0)
if l_0_1 or l_0_2 or l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
