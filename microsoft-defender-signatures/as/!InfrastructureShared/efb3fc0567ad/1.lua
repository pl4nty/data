-- Threat: !InfrastructureShared
-- Name: efb3fc0567ad
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  local l_0_1 = this_sigattrlog[1]
  local l_0_2 = this_sigattrlog[2]
  if l_0_1 ~= nil and l_0_1.matched and not isnull(l_0_1.utf8p1) then
    l_0_0 = l_0_1.utf8p1
  elseif l_0_2 ~= nil and l_0_2.matched and not isnull(l_0_2.utf8p1) then
    l_0_0 = l_0_2.utf8p1
  end
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_0)
if not string.find(l_0_3, "\\sysvol\\", 1, true) or not string.find(l_0_3, "\\policies\\", 1, true) then
  return mp.CLEAN
end
local l_0_5 = string.find(l_0_3, "\\logon\\", 1, true) ~= nil
local l_0_7 = string.find(l_0_3, "\\startup\\", 1, true) ~= nil
if not l_0_5 and not l_0_7 then
  return mp.CLEAN
end
if string.sub(l_0_3, -4) ~= ".exe" then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_string("gpo_sysvol_payload_location", l_0_5 and "Logon" or "Startup", bm.RelatedStringBMReport)
bm.add_related_string("gpo_sysvol_payload_stage", "process_start", bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_sysvol_payload_exec", 28800)
TrackPidAndTechniqueBM("BM", "T1484.001", "gpo_sysvol_payload_exec", 28800)
return mp.INFECTED
