-- Threat: !InfrastructureShared
-- Name: 2c9b3da46d551
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
  l_0_1 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
  l_0_1 = this_sigattrlog[8].utf8p1
else
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[9].matched or this_sigattrlog[10].matched
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if not isnull(l_0_3) then
  l_0_0 = string.lower(l_0_3)
end
local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_5
if not isnull(l_0_4) then
  l_0_5 = l_0_4[1]
else
  l_0_5 = l_0_0
end
local l_0_6
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_6 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_6 = string.lower(this_sigattrlog[10].utf8p1)
end
local l_0_7 = string.match(l_0_5, "\\([^\\]+)$")
local l_0_8 = false
if l_0_7 ~= nil and l_0_6 ~= nil and string.find(l_0_6, l_0_7, 1, true) then
  l_0_8 = true
  bm.add_related_string("CorrelatedExclusion", "AV_exclusion_matches_svc_binary", bm.RelatedStringBMReport)
end
if not l_0_8 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_5, true, false) then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  local l_0_9 = string.match(string.lower(l_0_1), "\\services\\([^\\]+)")
  if l_0_9 then
    bm.add_related_string("HijackedService", l_0_9, bm.RelatedStringBMReport)
  end
end
if sysio.IsFileExists(l_0_5) then
  bm.add_related_file(l_0_5)
  bm.add_threat_file(l_0_5)
end
TrackFileAndTechnique(l_0_5, "T1543.003:svc_hijack_with_av_excl", 1000)
TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack_excl")
TrackPidAndTechniqueBM("BM", "T1562.001", "av_tamper_svc_hijack")
TrackPidAndTechniqueBM("BM", "T1543.003", "susp_svc_dll_hijack_excl")
return mp.INFECTED
