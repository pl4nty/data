-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15eb3a866f654\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R1 in 'AssignReg'

if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  local l_0_1 = nil
  local l_0_0 = nil
else
  do
    -- DECOMPILER ERROR at PC42: Overwrote pending register: R0 in 'AssignReg'

    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
      local l_0_2, l_0_3, l_0_5, l_0_6, l_0_7, l_0_9, l_0_11, l_0_13, l_0_15, l_0_17 = l_0_1, (this_sigattrlog[4]).utf8p2
    else
      do
        do
          if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
            local l_0_4, l_0_8, l_0_10, l_0_12, l_0_14, l_0_16, l_0_18 = , (this_sigattrlog[5]).utf8p2
            l_0_10 = this_sigattrlog
            l_0_10 = l_0_10[5]
            l_0_4 = l_0_10.utf8p1
          end
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

          if IsExcludedByCmdlineMacOS(l_0_8) or IsExcludedByImagePathMacOS(l_0_4) then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC98: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC116: Confused about usage of register: R1 in 'UnsetPending'

          if l_0_4 ~= nil and l_0_8 ~= nil and (is_valid_ip(l_0_8) ~= nil or (string.find)(l_0_8, "/bin/bash", 1, true) or (string.find)(l_0_8, "/bin/sh", 1, true) or (string.find)(l_0_8, "/bin/zsh", 1, true) or (string.find)(l_0_8, "sh -i", 1, true)) then
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

