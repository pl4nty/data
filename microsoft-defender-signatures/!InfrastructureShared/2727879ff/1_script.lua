-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2727879ff\1_luac 

-- params : ...
-- function num : 0
do
  if ((hstrlog[3]).matched and not (hstrlog[4]).matched) or (hstrlog[6]).matched then
    local l_0_0 = 0 + 1 + 1 + 1
  end
  do
    if ((((((hstrlog[1]).matched and not (hstrlog[2]).matched) or (hstrlog[3]).matched) and not (hstrlog[4]).matched) or (hstrlog[5]).matched) and not (hstrlog[6]).matched) or (hstrlog[7]).matched then
      local l_0_1 = nil
    end
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_1 >= 1 or 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 >= 2 or 0 + 1 + 1 + 1 + 1 + 1 + 1 + 1 >= 3 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

