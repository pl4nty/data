-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\247b3c0091072\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_3, l_0_6, l_0_10, l_0_12, l_0_15, l_0_19, l_0_22, l_0_26 = nil, nil, nil, nil
  end
  do
    if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 ~= nil then
      local l_0_2, l_0_4, l_0_7, l_0_11, l_0_13, l_0_16, l_0_20, l_0_23, l_0_27 = , (this_sigattrlog[12]).utf8p2
    end
    do
      if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 ~= nil then
        local l_0_5, l_0_8, l_0_14, l_0_17, l_0_21, l_0_24, l_0_28 = , (this_sigattrlog[13]).utf8p2
      end
      do
        if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 ~= nil then
          local l_0_9, l_0_18, l_0_25, l_0_29 = , (this_sigattrlog[14]).utf8p2
        end
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC60: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC64: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC66: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC72: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

        -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC76: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

        -- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

        if l_0_9 ~= nil and l_0_9 ~= "" and l_0_18 ~= nil and l_0_18 ~= "" and l_0_25 ~= nil and l_0_25 ~= "" and l_0_29 ~= nil and l_0_29 ~= "" and l_0_9 ~= l_0_18 and l_0_9 ~= l_0_25 and l_0_9 ~= l_0_29 and l_0_18 ~= l_0_25 and l_0_18 ~= l_0_29 and l_0_25 ~= l_0_29 then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

