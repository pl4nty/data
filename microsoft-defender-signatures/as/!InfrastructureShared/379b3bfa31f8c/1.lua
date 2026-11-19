-- Threat: !InfrastructureShared
-- Name: 379b3bfa31f8c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 150000000
local l_0_3 = bm.GetSignatureMatchDuration()
if l_0_2 < l_0_3 then
  return mp.CLEAN
end
local l_0_4 = 0
for l_0_5 = 1, l_0_0 do
  local l_0_6 = sigattr_tail[l_0_5].attribute
  if l_0_6 == 16388 then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1
    if l_0_7 ~= nil and l_0_7 ~= "" and l_0_1[l_0_7] == nil and isSensitiveFileForLinux(l_0_7) then
      l_0_1[l_0_7] = true
      bm.add_related_file(l_0_7)
      l_0_4 = l_0_4 + 1
    end
  end
end
if 10 <= l_0_4 then
  local l_0_8 = bm.get_current_process_startup_info()
  if l_0_8 ~= nil and l_0_8.ppid ~= nil and IsDetectionThresholdMetLinux(l_0_8.ppid) then
    addRelatedProcess()
    reportRelatedBmHits()
    RemediateProcessTreeForLinux()
    return mp.INFECTED
  end
  TrackPidAndTechniqueBM("BM", "T1083", "Discovery_SensitiveFilesOpen")
end
return mp.CLEAN
