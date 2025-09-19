-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\81b37bfba666\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if this_sigattrlog[2] and (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not this_sigattrlog[3] or not (this_sigattrlog[3]).matched or this_sigattrlog[4]) and (this_sigattrlog[4]).matched then
      local l_0_1, l_0_2, l_0_3, l_0_4 = (this_sigattrlog[3]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

    if (this_sigattrlog[5] and (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 == nil) or #(this_sigattrlog[5]).utf8p2 < 62 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_5 = (string.lower)((this_sigattrlog[5]).utf8p2)
    local l_0_6 = contains
    local l_0_7 = l_0_5
    do
      local l_0_8 = {}
      -- DECOMPILER ERROR at PC84: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC88: Overwrote pending register: R1 in 'AssignReg'

      -- DECOMPILER ERROR at PC89: Overwrote pending register: R1 in 'AssignReg'

      if l_0_6 then
        return l_0_6
      end
      -- DECOMPILER ERROR at PC91: Overwrote pending register: R1 in 'AssignReg'

      -- DECOMPILER ERROR at PC92: Overwrote pending register: R1 in 'AssignReg'

      do return l_0_6 end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

