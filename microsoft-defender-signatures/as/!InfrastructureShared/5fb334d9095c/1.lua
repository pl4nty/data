-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fb334d9095c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1 or "")
local l_0_1 = (MpCommon.PathToWin32Path)((bm.get_imagepath)() or "")
local l_0_2 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_2.ppid) then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.IsKnownFriendlyFile, l_0_1, false, true)
if l_0_3 and l_0_4 then
  return mp.CLEAN
end
do
  local l_0_5, l_0_7, l_0_8 = (MpCommon.GetCurrentTimeT)() or 0
  do
    local l_0_6, l_0_9 = , (sysio.GetFileLastWriteTime)(l_0_1) or 0
    -- DECOMPILER ERROR at PC84: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC86: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC88: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC89: Confused about usage of register: R5 in 'UnsetPending'

    if l_0_6 == 0 or l_0_9 == 0 or l_0_6 - l_0_9 / 10000000 - 11644473600 > 3600 then
      return mp.CLEAN
    end
    local l_0_10 = nil
    ;
    (bm.add_related_file)(l_0_0)
    local l_0_14 = nil
    local l_0_15 = nil
    local l_0_16 = (sysio.GetFileAttributes)(l_0_1) ~= 4294967295 and (mp.bitand)((sysio.GetFileAttributes)(l_0_1), 2) == 2
    do
      local l_0_17 = bm.add_related_string
      l_0_17("Keylog_Metadata", safeJsonSerialize({ProcPath = l_0_1, Log = l_0_0, ProcHidden = l_0_16, ProcFileTime = l_0_14, FriendStatus = l_0_3 and "success" or "fail", Friend = l_0_4 and "yes" or "no"}), bm.RelatedStringBMReport)
      l_0_17 = TrackPidAndTechniqueBM
      l_0_17(l_0_2.ppid, "T1056.001", "collect_keylog")
      l_0_17 = mp
      l_0_17 = l_0_17.INFECTED
      do return l_0_17 end
      -- DECOMPILER ERROR: 5 unprocessed JMP targets
    end
  end
end

