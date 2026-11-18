-- Threat: !InfrastructureShared
-- Name: d7b358a32c3d
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
  if l_0_0:match("\\harddiskvolumeshadowcopy.+\\certutil.exe$") then
    return mp.CLEAN
  end
  if l_0_0:match("\\filehistory\\") then
    return mp.CLEAN
  end
  if l_0_1:match("programdata\\dell") then
    return mp.CLEAN
  end
  if l_0_0 ~= l_0_1 and not StringEndsWith(l_0_1, "\\certutil.exe") then
    TrackPidAndTechniqueBM(this_sigattrlog[4].ppid, "T1036", "masq_certutil")
    return mp.INFECTED
  end
end
return mp.CLEAN
