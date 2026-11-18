-- Threat: !InfrastructureShared
-- Name: e7b3e481ba08
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[5].matched or isnull(this_sigattrlog[5].utf8p1) then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
local l_0_1 = string.find(l_0_0, "\\google\\chrome\\application\\", 1, true) or string.find(l_0_0, "\\microsoft\\edge\\application\\", 1, true) or string.find(l_0_0, "\\microsoft\\edgewebview\\application\\", 1, true) or string.find(l_0_0, "\\brave-browser\\application\\", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("([^\\]+)$") or ""
if l_0_2 == "chrome_elf.dll" or l_0_2 == "chrome_proxy.dll" or l_0_2 == "mojo_core.dll" or l_0_2 == "elevation_service.dll" or l_0_2 == "msedge_elf.dll" or l_0_2 == "msedgewebview2.dll" then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_0, 604800) == false then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1574.001", "SuspBrowserAppDirSideLoad")
return mp.INFECTED
