-- Threat: !InfrastructureShared
-- Name: 1ddb3fbd1886d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local function l_0_0()
  local l_1_0 = this_sigattrlog[1]
  
  if l_1_0 ~= nil and l_1_0.matched and not isnull(l_1_0.utf8p1) then
    return l_1_0.utf8p1
  end
  l_1_0 = this_sigattrlog[2]
  if l_1_0 ~= nil and l_1_0.matched and not isnull(l_1_0.utf8p1) then
    return l_1_0.utf8p1
  end
  l_1_0 = this_sigattrlog[3]
  if l_1_0 ~= nil and l_1_0.matched and not isnull(l_1_0.utf8p1) then
    return l_1_0.utf8p1
  end
  l_1_0 = this_sigattrlog[4]
  if l_1_0 ~= nil and l_1_0.matched and not isnull(l_1_0.utf8p1) then
    return l_1_0.utf8p1
  end
  return nil
end

local l_0_1 = l_0_0()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
if not string.find(l_0_2, "\\sysvol\\", 1, true) or not string.find(l_0_2, "\\policies\\", 1, true) then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_2, "\\logon\\", 1, true) ~= nil
local l_0_6 = string.find(l_0_2, "\\startup\\", 1, true) ~= nil
if not l_0_4 and not l_0_6 then
  return mp.CLEAN
end
if string.sub(l_0_2, -4) ~= ".exe" then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_string("gpo_sysvol_payload_location", l_0_4 and "Logon" or "Startup", bm.RelatedStringBMReport)
bm.add_related_string("gpo_sysvol_payload_stage", "create_or_modify", bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1484.001", "gpo_sysvol_pe_staging", 28800)
TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_sysvol_pe_staging", 28800)
return mp.INFECTED
