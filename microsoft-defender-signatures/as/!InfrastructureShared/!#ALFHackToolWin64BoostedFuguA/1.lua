-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolWin64BoostedFuguA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_postemu_sigattr_log_head_size)()
for l_0_4 = 1, l_0_0 do
  local l_0_5 = (pe.get_postemu_sigattr_log_head)(l_0_4)
  if l_0_5.attribute == 12296 and l_0_5.p1 ~= nil and #l_0_5.p1 > 0 and #l_0_5.p1 < 260 and (sysio.IsFileExists)(l_0_5.p1) then
    do
      do
        (mp.ReportLowfi)(l_0_5.p1, 180264216)
        do break end
        -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
return mp.INFECTED

