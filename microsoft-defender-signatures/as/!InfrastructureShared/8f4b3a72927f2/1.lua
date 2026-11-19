-- Threat: !InfrastructureShared
-- Name: 8f4b3a72927f2
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
local l_0_2 = ""
if this_sigattrlog[42].matched then
  l_0_1 = this_sigattrlog[42].ppid
  l_0_0, _ = string.find(this_sigattrlog[42].utf8p1, "/bash", 1, true)
  if l_0_0 ~= nil and sysio.IsFileExists("/run/yum.pid") then
    return mp.CLEAN
  end
  if isParentPackageManager(l_0_1) then
    return mp.CLEAN
  end
end
if this_sigattrlog[43].matched then
  l_0_2 = "T1546.004"
elseif this_sigattrlog[44].matched then
  l_0_2 = "T1543.002"
elseif this_sigattrlog[45].matched then
  l_0_2 = "T1543"
elseif this_sigattrlog[46].matched then
  l_0_2 = "T1546"
elseif this_sigattrlog[47].matched then
  l_0_2 = "T1547.006"
elseif this_sigattrlog[48].matched then
  l_0_2 = "T1037.004"
elseif this_sigattrlog[49].matched then
  l_0_2 = "T1053.003"
else
  return mp.CLEAN
end
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1, l_0_2, "Persistence")
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
