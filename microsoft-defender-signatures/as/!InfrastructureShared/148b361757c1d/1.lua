-- Threat: !InfrastructureShared
-- Name: 148b361757c1d
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
if this_sigattrlog[6] == nil or not this_sigattrlog[6].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[6].utf8p1 or "unknown"
local l_0_1 = this_sigattrlog[6].utf8p2 or ""
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
if string.find(l_0_3, "\\windows defender\\", 1, true) then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_0)
if string.find(l_0_4, "eicar", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_4, "amsi test", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("WinRMAmsi_detection", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("WinRMAmsi_result", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("WinRMAmsi_process", l_0_3, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1059.001", "WinRMAmsiSusp")
add_parents()
return mp.INFECTED
