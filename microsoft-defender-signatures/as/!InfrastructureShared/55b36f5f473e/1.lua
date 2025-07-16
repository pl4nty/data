-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b36f5f473e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p1) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[1]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
local l_0_3 = {}
local l_0_4 = {}
if mp.SIGATTR_LOG_SZ > 0 then
  for l_0_8 = mp.SIGATTR_LOG_SZ, 1, -1 do
    if not (sigattr_tail[l_0_8]).utf8p2 then
      local l_0_9 = (string.match)((sigattr_tail[l_0_8]).attribute < 16384 or (sigattr_tail[l_0_8]).attribute > 16389 or isnull((sigattr_tail[l_0_8]).utf8p1) or "", "Fsize:(%d+)")
      local l_0_10 = table.insert
      local l_0_11 = l_0_3
      local l_0_12 = string.format
      local l_0_13 = "Path: %s; Size: %s"
      local l_0_14 = (MpCommon.PathToWin32Path)((sigattr_tail[l_0_8]).utf8p1)
      do
        l_0_10(l_0_11, l_0_12(l_0_13, l_0_14, l_0_9 or "n/a"))
        -- DECOMPILER ERROR at PC89: Confused about usage of register R13 for local variables in 'ReleaseLocals'

        l_0_9 = sigattr_tail
        l_0_9 = l_0_9[l_0_8]
        l_0_9 = l_0_9.attribute
        if l_0_9 == 16400 then
          l_0_9 = isnull
          l_0_10 = sigattr_tail
          l_0_10 = l_0_10[l_0_8]
          l_0_10 = l_0_10.utf8p1
          l_0_9 = l_0_9(l_0_10)
          if not l_0_9 then
            l_0_9 = table
            l_0_9 = l_0_9.insert
            l_0_10 = l_0_4
            l_0_11 = string
            l_0_11 = l_0_11.format
            l_0_9(l_0_10, l_0_11("Path: %s; Cmdline: %s", (MpCommon.PathToWin32Path)((sigattr_tail[l_0_8]).utf8p1), (sigattr_tail[l_0_8]).utf8p2 or "n/a"))
            -- DECOMPILER ERROR at PC122: Confused about usage of register R12 for local variables in 'ReleaseLocals'

          end
        end
        -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
local l_0_16 = nil
local l_0_17 = nil
local l_0_18 = nil
local l_0_19 = nil
do
  ;
  (bm.add_related_string)(l_0_0, safeJsonSerialize({RQ = l_0_9, Files = l_0_3, Procs = l_0_4, OriginalFile = l_0_1}), bm.RelatedStringBMReport)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC142: Confused about usage of register R11 for local variables in 'ReleaseLocals'

end

