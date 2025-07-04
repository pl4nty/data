-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\af4b3efc22683\1.luac 

-- params : ...
-- function num : 0
if not this_sigattrlog[28] or isnull((this_sigattrlog[28]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((this_sigattrlog[28]).utf8p1)
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
if isnull(l_0_0) or (mp.IsKnownFriendlyFile)(l_0_0, false, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
if isnull(l_0_1) or not (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("^(.+)\\")
local l_0_3 = l_0_1:match("^(.+)\\")
if not l_0_2 or not l_0_3 or not (string.find)((string.lower)(l_0_2), (string.lower)(l_0_3), 1, true) then
  return mp.CLEAN
end
local l_0_4 = 900
local l_0_5 = (MpCommon.GetCurrentTimeT)()
if isnull(l_0_5) or l_0_5 == 0 then
  return mp.CLEAN
end
local l_0_6 = (sysio.GetFileLastWriteTime)(l_0_1)
if isnull(l_0_6) or l_0_6 == 0 then
  return mp.CLEAN
end
if l_0_4 < l_0_5 - l_0_6 / 10000000 - 11644473600 then
  return mp.CLEAN
end
local l_0_7 = (sysio.GetFileLastWriteTime)(l_0_0)
if isnull(l_0_7) or l_0_7 == 0 then
  return mp.CLEAN
end
if l_0_4 < l_0_5 - l_0_7 / 10000000 - 11644473600 then
  return mp.CLEAN
end
local l_0_8 = (sysio.GetFileAttributes)(l_0_0)
local l_0_11 = l_0_8 ~= 4294967295 and (mp.bitand)(l_0_8, 2) == 2
do
  local l_0_12 = safeJsonSerialize
  l_0_12 = l_0_12({Process = l_0_1, DLL = l_0_0, DLLHidden = l_0_11, ProcessCreateTime = l_0_6, DLLCreateTime = l_0_7, CurrentTime = l_0_5})
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.add_related_string)("PotentialSideload_Metadata", l_0_12, bm.RelatedStringBMReport)
  ;
  (bm.set_detection_string)(l_0_12)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

