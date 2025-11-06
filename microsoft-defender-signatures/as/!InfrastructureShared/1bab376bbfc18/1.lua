-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bab376bbfc18\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
      local l_0_1 = (this_sigattrlog[3]).utf8p2
    end
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
        local l_0_2 = (this_sigattrlog[5]).utf8p2
      end
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[7]).matched or (this_sigattrlog[8]).matched then
          local l_0_3 = (this_sigattrlog[7]).utf8p2
        end
        -- DECOMPILER ERROR at PC71: Overwrote pending register: R0 in 'AssignReg'

        do
          if not (this_sigattrlog[9]).matched or (this_sigattrlog[10]).matched then
            local l_0_4 = (this_sigattrlog[9]).utf8p2
          end
          local l_0_5 = nil
          local l_0_6 = bm.add_related_string
          do
            l_0_6("InjectionType", l_0_5 or "", bm.RelatedStringBMReport)
            l_0_6 = mp
            l_0_6 = l_0_6.INFECTED
            do return l_0_6 end
            -- DECOMPILER ERROR at PC84: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

