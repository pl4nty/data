-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\117b358851dfa\0x0000043f_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1 = this_sigattrlog[2]
    else
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p2 ~= nil then
        local l_0_2, l_0_3 = this_sigattrlog[4]
      end
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

      if not l_0_2 then
        return mp.CLEAN
      end
      local l_0_4 = nil
      local l_0_5 = "DataExfilCreatedFile"
      local l_0_6 = (string.lower)(l_0_4.utf8p2)
      if IsKeyInRollingQueue("DataComTrack", l_0_5) and next(IsKeyInRollingQueue("DataComTrack", l_0_5)) then
        for l_0_10,l_0_11 in ipairs(IsKeyInRollingQueue("DataComTrack", l_0_5)) do
          local l_0_7 = nil
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R8 in 'UnsetPending'

          if contains(l_0_6, R8_PC116) then
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

