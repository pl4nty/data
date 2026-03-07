-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c9b385de8abe\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[4]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p1 ~= nil then
        local l_0_2 = (this_sigattrlog[6]).utf8p1
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p1 ~= nil then
          local l_0_3, l_0_4 = (this_sigattrlog[8]).utf8p1
        end
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_3 == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_5 = nil
        local l_0_6 = (string.lower)(l_0_3)
        local l_0_7 = contains
        local l_0_8 = l_0_6
        l_0_7 = l_0_7(l_0_8, {"node_modules", ".openclaw/skills/"})
        if l_0_7 then
          l_0_7 = mp
          l_0_7 = l_0_7.CLEAN
          return l_0_7
        end
        l_0_8 = ".sh"
        l_0_8 = false
        for l_0_12,i_2 in ipairs(l_0_7) do
          if l_0_6:sub(-#i_2) == i_2 then
            l_0_8 = true
            break
          end
        end
        do
          if not l_0_8 then
            local l_0_13 = contains
            local l_0_14 = l_0_6
            local l_0_15 = {}
            -- DECOMPILER ERROR at PC151: No list found for R6 , SetList fails

          end
          do
            do
              -- DECOMPILER ERROR at PC156: Overwrote pending register: R4 in 'AssignReg'

              if not l_0_8 then
                return l_0_13.CLEAN
              end
              ;
              (bm.add_related_file)(l_0_5)
              -- DECOMPILER ERROR at PC166: Overwrote pending register: R7 in 'AssignReg'

              TrackPidAndTechniqueBM("BM", "T1105", "/etc/cron")
              add_parents()
              do return mp.INFECTED end
              -- WARNING: undefined locals caused missing assignments!
            end
          end
        end
      end
    end
  end
end

