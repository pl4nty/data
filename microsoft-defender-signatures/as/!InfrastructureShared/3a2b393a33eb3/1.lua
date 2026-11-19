-- Threat: !InfrastructureShared
-- Name: 3a2b393a33eb3
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2
if this_sigattrlog[5].matched then
  l_0_0, l_0_1, l_0_2 = "temp", "exe", this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0, l_0_1, l_0_2 = "temp", "dll", this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0, l_0_1, l_0_2 = "temp", "ps1", this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0, l_0_1, l_0_2 = "appdata", "exe", this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0, l_0_1, l_0_2 = "appdata", "dll", this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched then
  l_0_0, l_0_1, l_0_2 = "appdata", "ps1", this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched then
  l_0_0, l_0_1, l_0_2 = "programdata", "exe", this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched then
  l_0_0, l_0_1, l_0_2 = "programdata", "dll", this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched then
  l_0_0, l_0_1, l_0_2 = "programdata", "ps1", this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched then
  l_0_0, l_0_1, l_0_2 = "public", "exe", this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched then
  l_0_0, l_0_1, l_0_2 = "public", "dll", this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched then
  l_0_0, l_0_1, l_0_2 = "public", "ps1", this_sigattrlog[16].utf8p1
else
  return mp.CLEAN
end
bm.add_related_string("winrm_payload_drop", l_0_0 .. ":" .. l_0_1, bm.RelatedStringBMReport)
if l_0_2 then
  bm.add_related_file(l_0_2)
end
mp.set_mpattribute("Lua:Context/WinRMSessionDroppedFile.A")
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMPayloadDrop")
TrackPidAndTechniqueBM("BM", "T1105", "WinRMPayloadDrop")
add_parents()
return mp.INFECTED
