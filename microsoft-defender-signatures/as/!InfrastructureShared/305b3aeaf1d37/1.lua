-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\305b3aeaf1d37\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p2 == nil or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[8]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[10]).matched or (this_sigattrlog[10]).utf8p2 == nil or (this_sigattrlog[11]).matched) and (this_sigattrlog[11]).utf8p2 ~= nil then
        local l_0_2 = (this_sigattrlog[10]).utf8p2
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[12]).matched or (this_sigattrlog[12]).utf8p2 == nil or (this_sigattrlog[13]).matched) and (this_sigattrlog[13]).utf8p2 ~= nil then
          local l_0_3, l_0_4, l_0_5 = (this_sigattrlog[12]).utf8p2
        else
        end
        if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 ~= nil then
          local l_0_6 = (this_sigattrlog[14]).utf8p2
          if l_0_6 ~= nil then
            for l_0_10,l_0_11 in ipairs({"curl ", "wget ", "whoami"}) do
              local l_0_7 = nil
              -- DECOMPILER ERROR at PC125: Confused about usage of register: R6 in 'UnsetPending'

              if (string.find)(l_0_6, R6_PC125) then
                return mp.INFECTED
              end
            end
          end
          do
            return mp.CLEAN
          end
        end
      end
    end
  end
end

