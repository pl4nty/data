-- Threat: !InfrastructureShared
-- Name: 19b3689ffc86
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = {}
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 then
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if l_0_4.ppid and l_0_4.image_path then
      table.insert(l_0_0, string.format("%s (%s)", l_0_4.image_path, l_0_4.ppid))
      bm.add_threat_process(l_0_4.ppid)
      MpCommon.SetTaintedProcess(l_0_4.ppid, bm.BM_TAINT_OTHER)
    end
  end
end
local l_0_5 = {}
if mp.SIGATTR_LOG_SZ > 0 then
  for l_0_6 = mp.SIGATTR_LOG_SZ, 1, -1 do
    if sigattr_tail[l_0_6].utf8p1 and (sigattr_tail[l_0_6].attribute == 16384 or sigattr_tail[l_0_6].attribute == 16385) then
      table.insert(l_0_5, string.format("0x%x: %s", sigattr_tail[l_0_6].attribute, sigattr_tail[l_0_6].utf8p1))
      bm.add_threat_file(sigattr_tail[l_0_6].utf8p1)
    end
  end
end
local l_0_7 = safeJsonSerialize({CreatedProcs = l_0_0, CreatedFiles = l_0_5})
bm.add_related_string("SuspiciousHTTPRequestHeaders_Activity", l_0_7, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_7)
local l_0_8 = bm.get_current_process_startup_info()
if l_0_8 and l_0_8.ppid then
  TrackPidAndTechniqueBM(l_0_8.ppid, "T1071.001", "c2_http")
  if not isnull(this_sigattrlog[1].utf8p2) and not string.find(this_sigattrlog[1].utf8p2, "DestPort=80;", 1, true) then
    TrackPidAndTechniqueBM(l_0_8.ppid, "T1571", "c2_http_nonstandardport")
  end
end
return mp.INFECTED
