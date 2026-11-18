-- Threat: !InfrastructureShared
-- Name: 1f5b3f7debf29
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 150000000
local l_0_3 = bm.GetSignatureMatchDuration()
if l_0_2 < l_0_3 then
  return mp.CLEAN
end
if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
local l_0_4 = 0
for l_0_5 = 1, l_0_0 do
  local l_0_6 = sigattr_tail[l_0_5].attribute
  if l_0_6 == 16386 then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1
    local l_0_8 = sigattr_tail[l_0_5].utf8p2
    if l_0_7 ~= nil and l_0_7 ~= "" and l_0_8 ~= nil and l_0_8 ~= "" and l_0_1[l_0_8] == nil and isSensitiveFileForLinux(l_0_8) then
      l_0_1[l_0_8] = true
      bm.add_related_file(l_0_8)
      bm.add_related_file(l_0_7)
      l_0_4 = l_0_4 + 1
    end
  end
end
if 10 <= l_0_4 then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_SensitiveFileTampering")
  local l_0_9 = safeJsonSerialize(l_0_1)
  bm.add_related_string("file_metadata", l_0_9, bm.RelatedStringBMReport)
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN
