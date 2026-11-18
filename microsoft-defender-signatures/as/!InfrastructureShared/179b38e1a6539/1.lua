-- Threat: !InfrastructureShared
-- Name: 179b38e1a6539
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1, l_0_2, l_0_3 = IsFileRecentlyDropped(l_0_0)
if l_0_1 and l_0_2 and l_0_3 then
  local l_0_4 = safeJsonDeserialize(l_0_3)
  if l_0_4 and l_0_4.URL and not l_0_4.UnsignedFile then
    bm.add_related_string("OysterLoader", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  end
end
return mp.INFECTED
