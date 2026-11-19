-- Threat: !InfrastructureShared
-- Name: 1f3b36437d460
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched and not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[3].matched and not isnull(this_sigattrlog[3].utf8p1) then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and not isnull(this_sigattrlog[4].utf8p1) then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and not isnull(this_sigattrlog[5].utf8p1) then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and not isnull(this_sigattrlog[6].utf8p1) then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and not isnull(this_sigattrlog[7].utf8p1) then
  l_0_0 = this_sigattrlog[7].utf8p1
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = l_0_1:match("%.([a-z0-9]+)$") or ""
if l_0_2 ~= "exe" and l_0_2 ~= "dll" then
  return mp.CLEAN
end
if not IsProcNameInParentProcessTree("BM", {
  "gpscript.exe"
}, 4) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[1].matched and not isnull(this_sigattrlog[1].utf8p2) then
  l_0_3 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and not isnull(this_sigattrlog[2].utf8p2) then
  l_0_3 = this_sigattrlog[2].utf8p2
end
if not isnull(l_0_3) then
  local l_0_4 = string.lower(l_0_3)
  if string.find(l_0_4, "executionpolicy bypass", 1, true) or string.find(l_0_4, "-ep bypass", 1, true) or string.find(l_0_4, "executionpolicy unrestricted", 1, true) then
    bm.add_related_string("gpo_payload_ps_execpolicy", "bypass", bm.RelatedStringBMReport)
  end
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
bm.add_related_string("gpo_payload_browser_dir", l_0_1, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_logon_script_payload_drop", 28800)
TrackPidAndTechniqueBM("BM", "T1105", "gpo_logon_script_payload_drop", 28800)
TrackPidAndTechniqueBM("BM", "T1574.002", "gpo_logon_script_payload_drop", 28800)
return mp.INFECTED
