-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d1b3a6d3e732\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
      local l_0_1 = this_sigattrlog[4]
    else
    end
    -- DECOMPILER ERROR at PC38: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[6]).matched or (this_sigattrlog[7]).matched then
        local l_0_2 = this_sigattrlog[6]
      else
      end
      -- DECOMPILER ERROR at PC54: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[8]).matched or (this_sigattrlog[9]).matched then
          local l_0_3 = this_sigattrlog[8]
        else
        end
        -- DECOMPILER ERROR at PC70: Overwrote pending register: R0 in 'AssignReg'

        do
          if not (this_sigattrlog[10]).matched or (this_sigattrlog[11]).matched then
            local l_0_4 = this_sigattrlog[10]
          else
          end
          -- DECOMPILER ERROR at PC86: Overwrote pending register: R0 in 'AssignReg'

          do
            if not (this_sigattrlog[12]).matched or (this_sigattrlog[13]).matched then
              local l_0_5 = this_sigattrlog[12]
            else
            end
            -- DECOMPILER ERROR at PC102: Overwrote pending register: R0 in 'AssignReg'

            do
              if not (this_sigattrlog[14]).matched or (this_sigattrlog[15]).matched then
                local l_0_6 = this_sigattrlog[14]
              else
              end
              -- DECOMPILER ERROR at PC118: Overwrote pending register: R0 in 'AssignReg'

              do
                if not (this_sigattrlog[16]).matched or (this_sigattrlog[17]).matched then
                  local l_0_7 = this_sigattrlog[16]
                else
                end
                -- DECOMPILER ERROR at PC134: Overwrote pending register: R0 in 'AssignReg'

                do
                  if not (this_sigattrlog[18]).matched or (this_sigattrlog[19]).matched then
                    local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = this_sigattrlog[18]
                  else
                  end
                  -- DECOMPILER ERROR at PC145: Confused about usage of register: R0 in 'UnsetPending'

                  if ((this_sigattrlog[20]).matched and not this_sigattrlog[20]) or not (this_sigattrlog[20]).utf8p1 then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

                  local l_0_13 = nil
                  local l_0_14 = nil
                  local l_0_15 = (string.lower)((this_sigattrlog[20]).utf8p1)
                  if not contains(l_0_15, {"\\.claude\\", "\\.cursor\\rules\\", "\\.cursor\\rules", "\\.vscode\\", "\\.gemini\\", "\\.github\\", "\\.copilot\\", "\\.aider\\", "\\.windsurf\\"}, true) then
                    return mp.CLEAN
                  end
                  TrackPidAndTechniqueBM("BM", "T1195.002", "shaiworm_agentcfg")
                  add_parents()
                  local l_0_16, l_0_17 = , pcall(reportBmInfo)
                  -- DECOMPILER ERROR at PC198: Overwrote pending register: R9 in 'AssignReg'

                  if not l_0_17 and reportBmInfo then
                    (bm.add_related_string)("bmInfoFailReason", tostring(R9_PC196), R9_PC196)
                  end
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

