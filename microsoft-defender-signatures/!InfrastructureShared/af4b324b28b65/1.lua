-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\af4b324b28b65\1.luac 

-- params : ...
-- function num : 0
if not this_sigattrlog[28] or isnull((this_sigattrlog[28]).utf8p1) then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((this_sigattrlog[28]).utf8p1)
if isnull(l_0_0) then
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
local l_0_8 = (sysio.GetPEVersionInfo)(l_0_0)
;
(bm.add_related_string)("TEST", "called version info", bm.RelatedStringBMReport)
if not isnull(l_0_8) then
  for l_0_12,l_0_13 in pairs(l_0_8) do
    (bm.add_related_string)("TEST", (string.format)("k: %s v: %s", tostring(l_0_12), tostring(l_0_13)), bm.RelatedStringBMReport)
  end
  ;
  (bm.add_related_string)("TEST", "done loop version info", bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("TEST", "done version null check ", bm.RelatedStringBMReport)
local l_0_14 = (sysio.GetPEFixedVersionInfo)(l_0_0)
;
(bm.add_related_string)("TEST", "called fixed version info", bm.RelatedStringBMReport)
if not isnull(l_0_14) then
  for l_0_18,l_0_19 in pairs(l_0_14) do
    (bm.add_related_string)("TEST", (string.format)("k: %s v: %s", tostring(l_0_18), tostring(l_0_19)), bm.RelatedStringBMReport)
  end
  ;
  (bm.add_related_string)("TEST", "done loop fixed version info", bm.RelatedStringBMReport)
  if isnull(l_0_14.FileDate) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("TEST", "not null fixed version date", bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("TEST", (string.format)("Version date %s", tostring(l_0_14.FileDate)), bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("TEST", "done fixed version null check ", bm.RelatedStringBMReport)
local l_0_20 = (sysio.GetFileAttributes)(l_0_0)
local l_0_23 = l_0_20 ~= 4294967295 and (mp.bitand)(l_0_20, 2) == 2
do
  local l_0_24 = safeJsonSerialize
  l_0_24 = l_0_24({Process = l_0_1, DLL = l_0_0, DLLHidden = l_0_23, ProcessCreateTime = l_0_6, DLLCreateTime = l_0_7})
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.add_related_string)("PotentialSideload_Metadata", l_0_24, bm.RelatedStringBMReport)
  ;
  (bm.set_detection_string)(l_0_24)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

