-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4027819153d95\0x0000bcc6_luac 

-- params : ...
-- function num : 0
if candidatePeFile() then
  local l_0_0 = {}
  -- DECOMPILER ERROR at PC17: No list found for R0 , SetList fails

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

  for l_0_4 = hstrlog[3], hstrlog[4], hstrlog[5] do
    -- DECOMPILER ERROR at PC22: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC32: Overwrote pending register: R6 in 'AssignReg'

    if (hstrlog[7]).matched and (l_0_0[l_0_4]).VA ~= -1 then
      local l_0_5 = (pe.mmap_va)((hstrlog[8]).VA, 30)
      if (string.find)(l_0_5, "\014\000\a\128", 1, true) == nil then
        return mp.INFECTED
      end
    end
  end
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

