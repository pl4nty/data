-- Threat: !InfrastructureShared
-- Name: 13cb3c2b06014
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = ""
local l_0_1 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = MpCommon.QueryPersistContext(l_0_1, "NewPECreatedNoCert")
if not l_0_2 then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_1, 600) ~= false then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) == true then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2
if not l_0_3 then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_3, "Uri=([^;]+)")
l_0_0 = l_0_0 or string.match(l_0_3, "DestIp=([^;]*);")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_4 and not isPublicIP(l_0_4) then
  return mp.CLEAN
end
if not l_0_0:find("%.") then
  return mp.CLEAN
end
local l_0_5, l_0_6 = l_0_0:match("^([^:/?#]+)://(.+)$")
if not l_0_5 then
  l_0_0 = "http://" .. l_0_0
end
local l_0_7 = {}
l_0_7.SIG_CONTEXT = "NONFRIENDLYIMAGE"
l_0_7.CONTENT_SOURCE = "BM"
l_0_7.TAG = "INTERFLOW"
l_0_7.ProcName = l_0_1
local l_0_8, l_0_9 = mp.CheckUrl(l_0_0)
if l_0_8 == 1 and l_0_9 == 1 then
  return mp.CLEAN
end
local l_0_10 = SafeGetUrlReputation({l_0_0}, l_0_7, false, 2000)
if l_0_10.urls[l_0_0] and l_0_10.urls[l_0_0].determination == 2 and l_0_10.urls[l_0_0].confidence >= 60 then
  return mp.INFECTED
end
return mp.CLEAN
