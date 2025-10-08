-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#Recent_Exec_Drop\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if (MpCommon.PathToWin32Path)(l_0_0) or not l_0_0 then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_2 = {}
l_0_2.ProcessId = l_0_1
l_0_2.Process_Img = (MpCommon.GetImagePathFromPid)(l_0_1)
local l_0_3 = (mp.enum_mpattributesubstring)("")
do
  if l_0_3 and #l_0_3 > 0 then
    local l_0_4 = {}
    for l_0_8,l_0_9 in ipairs(l_0_3) do
      local l_0_10, l_0_11 = (MpCommon.StringRegExpSearch)("(alf:|slf:|tel:|detection:)", (string.lower)(l_0_9))
      if l_0_10 and #l_0_4 < 15 and l_0_9 ~= "Detection:FriendlyFiles" then
        (table.insert)(l_0_4, l_0_9)
      end
    end
    if #l_0_4 > 0 then
      l_0_4 = table_dedup(l_0_4)
      l_0_2.FileAttributes = "[" .. (table.concat)(l_0_4, "|") .. "]"
      ;
      (mp.set_mpattribute)("RecentExecDropWithAttrib")
    end
  end
  local l_0_12 = (mp.GetCertificateInfo)()
  if not l_0_12 or not next(l_0_12) then
    l_0_2.UnsignedFile = true
    ;
    (mp.set_mpattribute)("RecentExecDropUnsigned")
  end
  l_0_2.scan_reason = (mp.GetScanSource)() or nil
  if not (mp.IOAVGetDownloadUrl)() then
    l_0_2.URL = (mp.GetMOTWHostUrl)()
    do
      local l_0_13, l_0_14, l_0_15, l_0_16 = safeJsonSerialize(l_0_2) or ""
      -- DECOMPILER ERROR at PC162: Confused about usage of register: R5 in 'UnsetPending'

      AppendToRollingQueue("RQ_RecentExecDropped_MultipleKey_30m", l_0_0, l_0_13, 1800, 1000, 1)
      -- DECOMPILER ERROR at PC170: Confused about usage of register: R5 in 'UnsetPending'

      AppendToRollingQueue("RQ_RecentExecDropped", l_0_0, l_0_13, 31104000, 1000, 1)
      return mp.CLEAN
    end
  end
end

