-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\264b3e1763c43\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_1 = nil
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC21: Overwrote pending register: R0 in 'AssignReg'

  do
    if (this_sigattrlog[4]).matched then
      local l_0_2, l_0_3 = l_0_1, (this_sigattrlog[4]).utf8p2
    end
    do
      if (this_sigattrlog[5]).matched then
        local l_0_4 = nil
      end
      -- DECOMPILER ERROR at PC40: Overwrote pending register: R1 in 'AssignReg'

      -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

      do
        if (this_sigattrlog[6]).matched then
          local l_0_5, l_0_6 = l_0_4, (this_sigattrlog[5]).utf8p2
        end
        do
          if (this_sigattrlog[7]).matched then
            local l_0_7 = nil
          end
          -- DECOMPILER ERROR at PC62: Overwrote pending register: R1 in 'AssignReg'

          -- DECOMPILER ERROR at PC65: Overwrote pending register: R0 in 'AssignReg'

          do
            if (this_sigattrlog[8]).matched then
              local l_0_8, l_0_9 = l_0_7, (this_sigattrlog[7]).utf8p2
            end
            do
              if (this_sigattrlog[9]).matched then
                local l_0_10 = nil
              end
              -- DECOMPILER ERROR at PC84: Overwrote pending register: R1 in 'AssignReg'

              -- DECOMPILER ERROR at PC87: Overwrote pending register: R0 in 'AssignReg'

              do
                if (this_sigattrlog[10]).matched then
                  local l_0_11, l_0_12, l_0_13, l_0_15, l_0_18, l_0_19, l_0_22, l_0_25 = l_0_10, (this_sigattrlog[9]).utf8p2, nil
                end
                do
                  if (this_sigattrlog[11]).matched then
                    local l_0_14, l_0_16, l_0_20, l_0_23, l_0_26 = , (this_sigattrlog[11]).utf8p2
                    l_0_23 = this_sigattrlog
                    l_0_23 = l_0_23[11]
                    l_0_14 = l_0_23.utf8p1
                  end
                  do
                    if (this_sigattrlog[12]).matched then
                      local l_0_17, l_0_21, l_0_24, l_0_27 = , (this_sigattrlog[12]).utf8p1
                    end
                    -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

                    if not l_0_24 or not l_0_21 or not l_0_17 then
                      return mp.CLEAN
                    end
                    -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

                    ;
                    (bm.add_related_string)("InjectionType", l_0_21, bm.RelatedStringBMReport)
                    -- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

                    ;
                    (bm.add_related_string)("InjectedIn", l_0_17, bm.RelatedStringBMReport)
                    -- DECOMPILER ERROR at PC133: Confused about usage of register: R2 in 'UnsetPending'

                    ;
                    (bm.add_related_string)("File_Created", l_0_24, bm.RelatedStringBMReport)
                    return mp.INFECTED
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

