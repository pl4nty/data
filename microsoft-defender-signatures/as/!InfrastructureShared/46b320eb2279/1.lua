-- Threat: !InfrastructureShared
-- Name: 46b320eb2279
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = this_sigattrlog[1]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = l_0_0.utf8p2
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1:sub(-4) ~= "/ssh" then
  return mp.CLEAN
end
if not (" " .. l_0_2):find("%s%-i%s+[\"']?/dev/shm/[^%s\"']+") then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2) .. " "
if not l_0_3:find("%-o%s*[\"']?batchmode=yes%f[%W]") then
  return mp.CLEAN
end
if not l_0_3:find("%-o%s*[\"']?stricthostkeychecking=no%f[%W]") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1021.004", "ShmSshKeyUse")
add_parents()
return mp.INFECTED
