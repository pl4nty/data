-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57db347c9af32\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["fa39e988-6d35-4932-a5ba-cb3fc826497b"] = true
l_0_0["4fc75186-2d08-4463-8273-286762239d76"] = true
l_0_0["d9a6152d-f204-4f79-9124-02d20d71b4bb"] = true
l_0_0["d96c3b4f-2fab-47bc-b290-b77181ab7096"] = true
l_0_0["e19b7e59-ec56-4f6f-abe9-4b33f7ee7c69"] = true
local l_0_1 = (versioning.GetOrgID)()
if isnull(l_0_1) or not l_0_0[(string.lower)(l_0_1)] then
  return mp.CLEAN
end
local l_0_2 = nil
if not isnull((this_sigattrlog[14]).utf8p1) then
  l_0_2 = (this_sigattrlog[14]).utf8p1
else
  if not isnull((this_sigattrlog[15]).utf8p1) then
    l_0_2 = (this_sigattrlog[15]).utf8p1
  else
    return mp.CLEAN
  end
end
local l_0_3 = (MpCommon.PathToWin32Path)(l_0_2)
if isnull(l_0_3) or not (string.find)((string.lower)(l_0_3), "c:", 1, true) then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeyValue("PotentialSideLoadExports", (string.lower)(l_0_3))
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = l_0_4:match("ExpCount=(%d+)__FwdExpCount=(%d+)__LocalExpCount=(%d+)__ExpType=(.-)%.(.-)=(.-)__FwdExpNames=(.-)__LocalExpNames=(.-)__Size=(%d+)")
if isnull(l_0_10) or l_0_10 == "FailedExtraction" then
  return mp.CLEAN
end
local l_0_14 = {}
l_0_14["msvcp140.dll"] = true
l_0_14["msvcrt.dll"] = true
l_0_14["ucrtbase.dll"] = true
l_0_14["vcruntime140.dll"] = true
l_0_14["vcruntime140_1.dll"] = true
if l_0_14[(string.lower)(l_0_10)] then
  return mp.CLEAN
end
if (string.lower)(l_0_10) == "libomp.dll" and (string.find)((string.lower)(l_0_3), "libiomp5md.dll$") then
  return mp.CLEAN
end
local l_0_15 = (bm.get_imagepath)()
if isnull(l_0_15) then
  return mp.CLEAN
end
l_0_15 = (MpCommon.PathToWin32Path)(l_0_15)
if isnull(l_0_15) then
  return mp.CLEAN
end
l_0_15 = (mp.ContextualExpandEnvironmentVariables)(l_0_15)
if isnull(l_0_15) or not (mp.IsKnownFriendlyFile)(l_0_15, true, false) then
  return mp.CLEAN
end
local l_0_16 = l_0_3:match("^(.+)\\")
local l_0_17 = l_0_15:match("^(.+)\\")
if not l_0_16 or not l_0_17 or not (string.find)((string.lower)(l_0_16), (string.lower)(l_0_17), 1, true) then
  return mp.CLEAN
end
local l_0_18 = nil
if (string.find)(l_0_10, ":", 1, true) then
  l_0_18 = (MpCommon.PathToWin32Path)(l_0_10)
else
  l_0_18 = l_0_16 .. "\\" .. l_0_10
end
if isnull(l_0_18) or not (sysio.IsFileExists)(l_0_18) then
  return mp.CLEAN
end
local l_0_19 = 900
local l_0_20 = (MpCommon.GetCurrentTimeT)()
if isnull(l_0_20) or l_0_20 == 0 then
  return mp.CLEAN
end
local l_0_21 = (sysio.GetFileLastWriteTime)(l_0_15)
if isnull(l_0_21) or l_0_21 == 0 then
  return mp.CLEAN
end
local l_0_22 = (sysio.GetFileLastWriteTime)(l_0_3)
if isnull(l_0_22) or l_0_22 == 0 then
  return mp.CLEAN
end
if l_0_19 < l_0_20 - l_0_22 / 10000000 - 11644473600 then
  return mp.CLEAN
end
local l_0_23 = (sysio.GetFileAttributes)(l_0_3)
;
(bm.add_threat_file)(l_0_3)
;
(bm.add_related_file)(l_0_18)
local l_0_28 = l_0_23 ~= 4294967295 and (mp.bitand)(l_0_23, 2) == 2
do
  local l_0_29 = safeJsonSerialize
  l_0_29 = l_0_29({Process = l_0_15, DLL = l_0_3, DLLHidden = l_0_28, ProcessCreateTime = l_0_21, DLLCreateTime = l_0_22, CurrentTime = l_0_20, DLLSize = l_0_13, FwdDLL = l_0_18, ExpCount = l_0_5, FwdExpCount = l_0_6, LocalExpCount = l_0_7, FwdType = l_0_8, FwdStatus = l_0_9, FwdExp = l_0_11, LocalExp = l_0_12})
  ;
  (bm.add_related_string)("DLLProxy_Metadata", l_0_29, bm.RelatedStringBMReport)
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

