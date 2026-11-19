-- Threat: !InfrastructureShared
-- Name: 305b3b092fbba
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p2
  l_0_1 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p2
  l_0_1 = this_sigattrlog[13].utf8p1
else
  return mp.CLEAN
end
local l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if not isnull(l_0_2) then
  l_0_0 = string.lower(l_0_2)
end
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_4
if not isnull(l_0_3) then
  l_0_4 = l_0_3[1]
else
  l_0_4 = l_0_0
end
if mp.IsKnownFriendlyFile(l_0_4, true, false) then
  return mp.CLEAN
end
if not isnull(l_0_1) then
  local l_0_5 = string.match(string.lower(l_0_1), "\\services\\([^\\]+)")
  if l_0_5 then
    bm.add_related_string("HijackedService", l_0_5, bm.RelatedStringBMReport)
  end
end
if sysio.IsFileExists(l_0_4) then
  bm.add_related_file(l_0_4)
  bm.add_threat_file(l_0_4)
end
local l_0_6 = bm.get_imagepath()
if not isnull(l_0_6) then
  bm.add_related_string("AttackerTool", l_0_6, bm.RelatedStringBMReport)
end
TrackFileAndTechnique(l_0_4, "T1543.003:svc_hijack_script_chain", 1000)
TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack_script")
TrackPidAndTechniqueBM("BM", "T1543.003", "susp_svc_dll_hijack_script")
return mp.INFECTED
