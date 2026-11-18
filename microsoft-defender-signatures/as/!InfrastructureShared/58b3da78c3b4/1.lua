-- Threat: !InfrastructureShared
-- Name: 58b3da78c3b4
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  if l_0_0 ~= l_0_1 and not StringEndsWith(l_0_1, "\\certutil.exe") then
    if sysio.IsFileExists(l_0_1) then
      bm.add_threat_file(l_0_1)
    end
    TrackPidAndTechniqueBM(this_sigattrlog[1].ppid, "T1036", "masq_certutil")
    return mp.INFECTED
  end
end
return mp.CLEAN
