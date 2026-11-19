-- Threat: !InfrastructureShared
-- Name: 41b340d3e0bd
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local function l_0_0(l_1_0)
  if not l_1_0 or type(l_1_0) ~= "string" then
    return nil
  end
  return (l_1_0:match("^(.*)[/\\][^/\\]+$"))
end

local l_0_1 = bm.get_imagepath()
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2
local l_0_3 = this_sigattrlog and this_sigattrlog[3]
if l_0_3 and l_0_3.matched and l_0_3.utf8p1 then
  l_0_2 = MpCommon.PathToWin32Path(l_0_3.utf8p1)
end
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if mp.IsKnownFriendlyFile(l_0_2, true, false) then
  return mp.CLEAN
end
if string.find(l_0_2, "\\windows\\system32", 1, true) or string.find(l_0_2, "\\windows\\syswow64", 1, true) then
  return mp.CLEAN
end
local l_0_4 = l_0_0(l_0_1)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_0(l_0_2)
if not l_0_5 then
  return mp.CLEAN
end
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_6, l_0_7, l_0_8 = IsFileRecentlyDropped(l_0_2)
if l_0_6 and l_0_7 and l_0_8 then
  local l_0_9 = safeJsonDeserialize(l_0_8)
  if l_0_9 and l_0_9.UnsignedFile then
    return mp.INFECTED
  end
end
return mp.CLEAN
