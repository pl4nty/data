-- Threat: !InfrastructureShared
-- Name: 58b3ab0bb170
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0) or l_0_0
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows\\system32\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\syswow64\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("^(.*)\\")
local l_0_2 = bm.get_imagepath()
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2) or l_0_2
l_0_2 = string.lower(l_0_2)
local l_0_3 = l_0_2:match("^(.*)\\")
if not (l_0_1 and l_0_3) or l_0_3 ~= l_0_1 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_4 = sysio.GetPEVersionInfo(l_0_2) or {}
local l_0_5 = l_0_4.OriginalFilename
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
if l_0_5 ~= "applaunch.exe" then
  return mp.CLEAN
end
local l_0_6, l_0_7, l_0_8 = IsFileRecentlyDropped(l_0_0)
if not (l_0_6 and l_0_7) or not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = safeJsonDeserialize(l_0_8)
if l_0_9 and l_0_9.UnsignedFile then
  return mp.INFECTED
end
return mp.CLEAN
