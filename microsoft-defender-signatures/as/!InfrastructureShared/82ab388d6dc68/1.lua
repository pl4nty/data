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
local l_0_2 = l_0_1:match("Target=(.-)__")
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (bm.get_imagepath)()
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = (mp.ContextualExpandEnvironmentVariables)(l_0_3)
if isnull(l_0_3) or not (mp.IsKnownFriendlyFile)(l_0_3, true, false) then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("^(.+)\\")
local l_0_5 = l_0_3:match("^(.+)\\")
if not l_0_4 or not l_0_5 or not (string.find)((string.lower)(l_0_4), (string.lower)(l_0_5), 1, true) then
  return mp.CLEAN
end
local l_0_6 = l_0_4 .. "\\" .. l_0_2
do
  local l_0_7 = (sysio.IsFileExists)(l_0_6) and "yes" or "no"
  local l_0_8 = nil
  if isnull((MpCommon.GetCurrentTimeT)()) or (MpCommon.GetCurrentTimeT)() == 0 then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if isnull((sysio.GetFileLastWriteTime)(l_0_3)) or (sysio.GetFileLastWriteTime)(l_0_3) == 0 then
    return mp.CLEAN
  end
  local l_0_10 = nil
  if isnull((sysio.GetFileLastWriteTime)(l_0_0)) or (sysio.GetFileLastWriteTime)(l_0_0) == 0 then
    return mp.CLEAN
  end
  local l_0_11 = nil
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.add_related_file)(l_0_6)
  local l_0_16 = nil
  do
    local l_0_17 = (sysio.GetFileAttributes)(l_0_0) ~= 4294967295 and (mp.bitand)((sysio.GetFileAttributes)(l_0_0), 2) == 2
    ;
    (bm.add_related_string)("PotentialSideload_Metadata", safeJsonSerialize({Process = l_0_3, DLL = l_0_0, DLLHidden = l_0_17, ProcessCreateTime = l_0_10, DLLCreateTime = l_0_11, CurrentTime = l_0_9, ForwardedDLL = l_0_6, ForwardedDLLExists = l_0_8, ExportMetadata = l_0_1}), bm.RelatedStringBMReport)
    do return mp.INFECTED end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

