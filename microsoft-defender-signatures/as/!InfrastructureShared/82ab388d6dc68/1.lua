-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\82ab388d6dc68\1.luac 

-- params : ...
-- function num : 0
if not this_sigattrlog[23] or isnull((this_sigattrlog[23]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((this_sigattrlog[23]).utf8p1)
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = GetRollingQueueKeyValue("PotentialSideLoadExports", l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = (string.match)(l_0_1, "ExpCount=(%d+)_FwdExpCount=(%d+)_Type=(.+)_(.-)=(.+)_Names=(.+)")
if isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = (string.format)("ExpCount=%d_FwdExpCount=%d_Type=%s_%s=%s_Names=%s", tonumber(l_0_2), tonumber(l_0_3), l_0_4, l_0_5, l_0_6, l_0_7)
local l_0_9 = (bm.get_imagepath)()
if isnull(l_0_9) then
  return mp.CLEAN
end
l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
if isnull(l_0_9) then
  return mp.CLEAN
end
l_0_9 = (mp.ContextualExpandEnvironmentVariables)(l_0_9)
if isnull(l_0_9) or not (mp.IsKnownFriendlyFile)(l_0_9, true, false) then
  return mp.CLEAN
end
local l_0_10 = l_0_0:match("^(.+)\\")
local l_0_11 = l_0_9:match("^(.+)\\")
if not l_0_10 or not l_0_11 or not (string.find)((string.lower)(l_0_10), (string.lower)(l_0_11), 1, true) then
  return mp.CLEAN
end
local l_0_12 = (MpCommon.GetCurrentTimeT)()
if isnull(l_0_12) or l_0_12 == 0 then
  return mp.CLEAN
end
local l_0_13 = (sysio.GetFileLastWriteTime)(l_0_9)
if isnull(l_0_13) or l_0_13 == 0 then
  return mp.CLEAN
end
local l_0_14 = (sysio.GetFileLastWriteTime)(l_0_0)
if isnull(l_0_14) or l_0_14 == 0 then
  return mp.CLEAN
end
local l_0_15 = (sysio.GetFileAttributes)(l_0_0)
local l_0_18 = l_0_15 ~= 4294967295 and (mp.bitand)(l_0_15, 2) == 2
do
  local l_0_19 = safeJsonSerialize
  l_0_19 = l_0_19({Process = l_0_9, DLL = l_0_0, DLLHidden = l_0_18, ProcessCreateTime = l_0_13, DLLCreateTime = l_0_14, CurrentTime = l_0_12})
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.add_related_string)("PotentialSideload_Metadata", l_0_19, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("PotentialSideload_ExportMetadata", l_0_8, bm.RelatedStringBMReport)
  ;
  (bm.set_detection_string)(l_0_19)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

