-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3a2c511a1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((bm.get_imagepath)() or "")
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_1) or isnull(l_0_1.ppid) then
  return mp.CLEAN
end
do
  local l_0_2, l_0_4, l_0_5 = (MpCommon.GetCurrentTimeT)() or 0
  do
    local l_0_3, l_0_6 = , (sysio.GetFileLastWriteTime)(l_0_0) or 0
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC45: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC47: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_3 == 0 or l_0_6 == 0 or l_0_3 - l_0_6 / 10000000 - 11644473600 > 3600 then
      return mp.CLEAN
    end
    local l_0_7 = nil
    local l_0_10 = nil
    local l_0_11 = nil
    local l_0_12 = (sysio.GetFileAttributes)(l_0_0) ~= 4294967295 and (mp.bitand)((sysio.GetFileAttributes)(l_0_0), 2) == 2
    do
      local l_0_13 = bm.add_related_string
      l_0_13("Keylog_Metadata", safeJsonSerialize({ProcPath = l_0_0, ProcHidden = l_0_12, ProcFileTime = l_0_10}), bm.RelatedStringBMReport)
      l_0_13 = TrackPidAndTechniqueBM
      l_0_13(l_0_1.ppid, "T1056.001", "collect_keylog")
      l_0_13 = mp
      l_0_13 = l_0_13.INFECTED
      do return l_0_13 end
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end
end

