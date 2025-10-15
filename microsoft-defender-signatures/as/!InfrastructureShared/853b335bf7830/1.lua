-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\853b335bf7830\1.luac 

-- params : ...
-- function num : 0
if not this_sigattrlog[24] or isnull((this_sigattrlog[24]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((this_sigattrlog[24]).utf8p1)
if isnull(l_0_0) or not (string.find)((string.lower)(l_0_0), "c:", 1, true) then
  return mp.CLEAN
end
local l_0_1 = GetRollingQueueKeyValue("PotentialSideLoadExports", l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10 = l_0_1:match("ExpCount=(%d+)__FwdExpCount=(%d+)__LocalExpCount=(%d+)__ExpType=(.-)%.(.-)=(.-)__FwdExpNames=(.-)__LocalExpNames=(.-)__Size=(%d+)")
if isnull(l_0_7) or l_0_7 == "FailedExtraction" then
  return mp.CLEAN
end
local l_0_11 = (bm.get_imagepath)()
if isnull(l_0_11) then
  return mp.CLEAN
end
l_0_11 = (MpCommon.PathToWin32Path)(l_0_11)
if isnull(l_0_11) then
  return mp.CLEAN
end
l_0_11 = (mp.ContextualExpandEnvironmentVariables)(l_0_11)
if isnull(l_0_11) or not (mp.IsKnownFriendlyFile)(l_0_11, true, false) then
  return mp.CLEAN
end
local l_0_12 = l_0_0:match("^(.+)\\")
local l_0_13 = l_0_11:match("^(.+)\\")
if not l_0_12 or not l_0_13 or not (string.find)((string.lower)(l_0_12), (string.lower)(l_0_13), 1, true) then
  return mp.CLEAN
end
local l_0_14 = nil
if (string.find)(l_0_7, ":", 1, true) then
  l_0_14 = (MpCommon.PathToWin32Path)(l_0_7)
else
  l_0_14 = l_0_12 .. "\\" .. l_0_7
end
if isnull(l_0_14) or not (sysio.IsFileExists)(l_0_14) then
  return mp.CLEAN
end
local l_0_15 = 900
local l_0_16 = (MpCommon.GetCurrentTimeT)()
if isnull(l_0_16) or l_0_16 == 0 then
  return mp.CLEAN
end
local l_0_17 = (sysio.GetFileLastWriteTime)(l_0_0)
if isnull(l_0_17) or l_0_17 == 0 or l_0_15 < l_0_16 - l_0_17 / 10000000 - 11644473600 then
  return mp.CLEAN
end
local l_0_18 = (sysio.GetFileLastWriteTime)(l_0_11)
if isnull(l_0_18) or l_0_18 == 0 then
  return mp.CLEAN
end
local l_0_19 = (sysio.GetFileAttributes)(l_0_0)
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_file)(l_0_14)
local l_0_24 = l_0_19 ~= 4294967295 and (mp.bitand)(l_0_19, 2) == 2
do
  local l_0_25 = safeJsonSerialize
  l_0_25 = l_0_25({Process = l_0_11, DLL = l_0_0, DLLHidden = l_0_24, ProcessCreateTime = l_0_18, DLLCreateTime = l_0_17, CurrentTime = l_0_16, DLLSize = l_0_10, FwdDLL = l_0_14, ExpCount = l_0_2, FwdExpCount = l_0_3, LocalExpCount = l_0_4, FwdType = l_0_5, FwdStatus = l_0_6, FwdExp = l_0_8, LocalExp = l_0_9})
  ;
  (bm.add_related_string)("PotentialSideload_Metadata", l_0_25, bm.RelatedStringBMReport)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

