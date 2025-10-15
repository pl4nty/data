-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\176b3f69dff6d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_3, l_0_6, l_0_10 = nil, nil, nil, nil, nil
  end
  do
    if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
      local l_0_2, l_0_4, l_0_7, l_0_11 = , (this_sigattrlog[7]).utf8p1
    end
    do
      if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
        local l_0_5, l_0_8, l_0_12 = , (this_sigattrlog[8]).utf8p1
      end
      do
        if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
          local l_0_9, l_0_13 = nil
        end
        do
          if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
            local l_0_14 = nil
          end
          -- DECOMPILER ERROR at PC77: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC82: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC86: Confused about usage of register: R3 in 'UnsetPending'

          -- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

          if (not (this_sigattrlog[11]).matched or (this_sigattrlog[11]).utf8p1 == nil or l_0_14 ~= nil) and l_0_14 == l_0_13 and l_0_13 == l_0_12 and l_0_12 == (this_sigattrlog[9]).utf8p1 and (this_sigattrlog[9]).utf8p1 == (this_sigattrlog[10]).utf8p1 and (this_sigattrlog[10]).utf8p1 == nil then
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

