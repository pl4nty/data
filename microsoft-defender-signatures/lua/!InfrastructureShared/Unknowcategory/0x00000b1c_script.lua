-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000b1c_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).np2 ~= nil then
    local l_0_0, l_0_1, l_0_3, l_0_6, l_0_10, l_0_15, l_0_21, l_0_24, l_0_28, l_0_33 = nil, nil, nil, nil, nil, nil
  end
  do
    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).np2 then
      local l_0_2, l_0_4, l_0_7, l_0_11, l_0_16, l_0_22, l_0_25, l_0_29, l_0_34 = , (this_sigattrlog[6]).np2
    end
    do
      if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).np2 then
        local l_0_5, l_0_8, l_0_12, l_0_17, l_0_23, l_0_26, l_0_30, l_0_35 = , (this_sigattrlog[7]).np2
      end
      do
        if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).np2 then
          local l_0_9, l_0_13, l_0_18, l_0_27, l_0_31, l_0_36 = , (this_sigattrlog[8]).np2
        end
        do
          if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).np2 then
            local l_0_14, l_0_19, l_0_32, l_0_37 = nil
          end
          do
            if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).np2 then
              local l_0_20, l_0_38 = nil
            end
            -- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

            -- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC84: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

            -- DECOMPILER ERROR at PC94: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC96: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

            -- DECOMPILER ERROR at PC100: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC104: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

            -- DECOMPILER ERROR at PC106: Confused about usage of register: R4 in 'UnsetPending'

            -- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

            -- DECOMPILER ERROR at PC108: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC108: Confused about usage of register: R3 in 'UnsetPending'

            if l_0_20 ~= nil and l_0_38 ~= nil and l_0_32 ~= nil and l_0_37 ~= nil and (this_sigattrlog[9]).np2 ~= nil and (this_sigattrlog[10]).np2 ~= nil and l_0_20 ~= "" and l_0_38 ~= "" and l_0_32 ~= "" and l_0_37 ~= "" and (this_sigattrlog[9]).np2 ~= "" and (this_sigattrlog[10]).np2 ~= "" and l_0_20 == l_0_32 and l_0_38 == l_0_37 and l_0_32 == (this_sigattrlog[9]).np2 and l_0_37 == (this_sigattrlog[10]).np2 then
              return mp.INFECTED
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

