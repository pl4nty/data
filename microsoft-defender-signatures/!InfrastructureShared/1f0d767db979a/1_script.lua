-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f0d767db979a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
if l_0_0 == nil then
  return mp.CLEAN
end
do
  if not (l_0_0[1]).matched or (l_0_0[2]).matched then
    local l_0_1 = 0 + 1 + 1
  end
  do
    if ((l_0_0[3]).matched and not (l_0_0[4]).matched) or (l_0_0[5]).matched then
      local l_0_2 = nil
    end
    do
      if ((((((not (l_0_0[7]).matched or (l_0_0[8]).matched) and not (l_0_0[9]).matched) or (l_0_0[10]).matched) and not (l_0_0[11]).matched) or (l_0_0[12]).matched) and not (l_0_0[13]).matched) or (l_0_0[14]).matched then
        local l_0_3 = nil
      end
      -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

      do
        if l_0_3 >= 1 and 0 + 1 + 1 + 1 >= 1 and 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 >= 1 then
          local l_0_4 = nil
          if IsProcNameInParentProcessTree("cmdhstr", {"sqlservr.exe", "sqlps.exe", "sqlagent.exe"}) then
            return mp.INFECTED
          end
        end
        return mp.CLEAN
      end
    end
  end
end

