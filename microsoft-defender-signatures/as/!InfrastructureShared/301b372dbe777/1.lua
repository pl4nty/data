-- Threat: !InfrastructureShared
-- Name: 301b372dbe777
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[13].matched and this_sigattrlog[13].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[13].utf8p2)
elseif this_sigattrlog[14].matched and this_sigattrlog[14].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[14].utf8p2)
elseif this_sigattrlog[15].matched and this_sigattrlog[15].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[15].utf8p2)
elseif this_sigattrlog[16].matched and this_sigattrlog[16].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[16].utf8p2)
elseif this_sigattrlog[17].matched and this_sigattrlog[17].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[17].utf8p2)
elseif this_sigattrlog[18].matched and this_sigattrlog[18].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[18].utf8p2)
elseif this_sigattrlog[19].matched and this_sigattrlog[19].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[19].utf8p2)
elseif this_sigattrlog[20].matched and this_sigattrlog[20].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[20].utf8p2)
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
if l_0_0 then
  if this_sigattrlog[14].matched and string.find(l_0_0, "copy-as-is", 1, true) and string.find(l_0_0, "/usr/share/rear", 1, true) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
