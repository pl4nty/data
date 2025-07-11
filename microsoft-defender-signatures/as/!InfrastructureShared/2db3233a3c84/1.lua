-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db3233a3c84\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[2]).matched or isnull((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[2]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
local l_0_3 = {}
if mp.SIGATTR_LOG_SZ > 0 then
  for l_0_7 = mp.SIGATTR_LOG_SZ, 1, -1 do
    if not (sigattr_tail[l_0_7]).utf8p2 then
      local l_0_8 = (string.match)((sigattr_tail[l_0_7]).attribute ~= 16384 or isnull((sigattr_tail[l_0_7]).utf8p1) or (sigattr_tail[l_0_7]).utf8p1 == (this_sigattrlog[2]).utf8p1 or "", "Fsize:(%d+)")
      local l_0_9 = table.insert
      local l_0_10 = l_0_3
      local l_0_11 = string.format
      local l_0_12 = "Path: %s; Size: %s"
      local l_0_13 = (MpCommon.PathToWin32Path)((sigattr_tail[l_0_7]).utf8p1)
      do
        l_0_9(l_0_10, l_0_11(l_0_12, l_0_13, l_0_8 or "none"))
        -- DECOMPILER ERROR at PC91: Confused about usage of register R12 for local variables in 'ReleaseLocals'

        -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
local l_0_15 = nil
local l_0_16 = nil
local l_0_17 = nil
local l_0_18 = nil
do
  ;
  (bm.add_related_string)(l_0_0, safeJsonSerialize({RQ = l_0_8, CreatedFiles = l_0_3, OriginalFile = l_0_1}), bm.RelatedStringBMReport)
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC110: Confused about usage of register R11 for local variables in 'ReleaseLocals'

end

