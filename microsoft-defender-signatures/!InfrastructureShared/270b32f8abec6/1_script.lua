-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\270b32f8abec6\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[3]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[6]).matched) and (this_sigattrlog[6]).utf8p1 ~= nil then
        local l_0_2 = (this_sigattrlog[5]).utf8p1
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p1 == nil or (this_sigattrlog[8]).matched) and (this_sigattrlog[8]).utf8p1 ~= nil then
          local l_0_3, l_0_5, l_0_7, l_0_9, l_0_10, l_0_11, l_0_13, l_0_15, l_0_17 = (this_sigattrlog[7]).utf8p1, nil
        end
        if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
          local l_0_4 = nil
        else
          do
            -- DECOMPILER ERROR at PC123: Overwrote pending register: R1 in 'AssignReg'

            -- DECOMPILER ERROR at PC137: Overwrote pending register: R1 in 'AssignReg'

            if (not (this_sigattrlog[10]).matched or (this_sigattrlog[10]).utf8p1 == nil or (this_sigattrlog[11]).matched) and (this_sigattrlog[11]).utf8p1 ~= nil then
              local l_0_6 = nil
            else
              do
                -- DECOMPILER ERROR at PC151: Overwrote pending register: R1 in 'AssignReg'

                -- DECOMPILER ERROR at PC165: Overwrote pending register: R1 in 'AssignReg'

                if (not (this_sigattrlog[12]).matched or (this_sigattrlog[12]).utf8p1 == nil or (this_sigattrlog[13]).matched) and (this_sigattrlog[13]).utf8p1 ~= nil then
                  local l_0_8 = nil
                else
                  do
                    -- DECOMPILER ERROR at PC179: Overwrote pending register: R1 in 'AssignReg'

                    -- DECOMPILER ERROR at PC193: Overwrote pending register: R1 in 'AssignReg'

                    do
                      if (not (this_sigattrlog[14]).matched or (this_sigattrlog[14]).utf8p1 == nil or (this_sigattrlog[15]).matched) and (this_sigattrlog[15]).utf8p1 ~= nil then
                        local l_0_12, l_0_14, l_0_16, l_0_18 = , (this_sigattrlog[9]).utf8p1
                      end
                      -- DECOMPILER ERROR at PC194: Confused about usage of register: R0 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC196: Confused about usage of register: R1 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC198: Confused about usage of register: R0 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC200: Confused about usage of register: R1 in 'UnsetPending'

                      if l_0_12 == nil or l_0_14 == nil or l_0_12 == "" or l_0_14 == "" then
                        return mp.CLEAN
                      end
                      -- DECOMPILER ERROR at PC205: Confused about usage of register: R1 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC205: Confused about usage of register: R0 in 'UnsetPending'

                      if l_0_12 == l_0_14 then
                        addRelatedProcess()
                        reportRelatedBmHits()
                        return mp.INFECTED
                      end
                      return mp.CLEAN
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
end

