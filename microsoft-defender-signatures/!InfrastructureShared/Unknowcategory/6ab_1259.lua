-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ab_1259.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil, nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and ((string.find)(l_0_0, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)(l_0_0, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
    return mp.INFECTED
  end
  do
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
      local l_0_2, l_0_3, l_0_4, l_0_6, l_0_8, l_0_10, l_0_12, l_0_15, l_0_18, l_0_21 = (string.lower)((this_sigattrlog[4]).utf8p1), nil
    end
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_2 ~= nil and ((string.find)(l_0_2, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)(l_0_2, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
      return mp.INFECTED
    end
    do
      if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
        local l_0_5, l_0_7 = , (string.lower)((this_sigattrlog[2]).utf8p1)
      end
      -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

      if l_0_7 ~= nil and ((string.find)(l_0_7, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)(l_0_7, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
        return mp.INFECTED
      end
      do
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
          local l_0_9, l_0_11, l_0_13, l_0_16, l_0_19, l_0_22 = , (string.lower)((this_sigattrlog[5]).utf8p1)
        end
        -- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

        if l_0_11 ~= nil and ((string.find)(l_0_11, "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)(l_0_11, "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
          return mp.INFECTED
        end
        do
          if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
            local l_0_14, l_0_17 = nil
          end
          -- DECOMPILER ERROR at PC181: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC190: Confused about usage of register: R2 in 'UnsetPending'

          if (string.lower)((this_sigattrlog[3]).utf8p1) ~= nil and ((string.find)((string.lower)((this_sigattrlog[3]).utf8p1), "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)((string.lower)((this_sigattrlog[3]).utf8p1), "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
            return mp.INFECTED
          end
          do
            if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
              local l_0_20, l_0_23 = nil
            end
            -- DECOMPILER ERROR at PC221: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC230: Confused about usage of register: R2 in 'UnsetPending'

            if (string.lower)((this_sigattrlog[6]).utf8p1) ~= nil and ((string.find)((string.lower)((this_sigattrlog[6]).utf8p1), "\\irj\\servlet_jsp\\irj\\root\\", 1, true) ~= nil or (string.find)((string.lower)((this_sigattrlog[6]).utf8p1), "\\irj\\servlet_jsp\\irj\\work\\", 1, true) ~= nil) then
              return mp.INFECTED
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

