-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15eb3a866f654\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R1 in 'AssignReg'

if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  local l_0_1, l_0_3 = nil, nil
  local l_0_0 = nil
  l_0_0 = (this_sigattrlog[3]).ppid
  local l_0_4 = nil
else
  do
    -- DECOMPILER ERROR at PC45: Overwrote pending register: R0 in 'AssignReg'

    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
      local l_0_2 = l_0_1
    else
      do
        -- DECOMPILER ERROR at PC67: Overwrote pending register: R1 in 'AssignReg'

        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
          local l_0_6, l_0_8, l_0_10, l_0_12, l_0_14, l_0_16 = , (this_sigattrlog[4]).utf8p2, (this_sigattrlog[4]).ppid
          l_0_12 = this_sigattrlog
          l_0_12 = l_0_12[5]
          l_0_6 = l_0_12.utf8p1
          local l_0_5, l_0_7, l_0_9, l_0_11, l_0_13, l_0_15 = nil
          l_0_12 = this_sigattrlog
          l_0_12 = l_0_12[5]
          l_0_10 = l_0_12.ppid
          local l_0_17 = nil
        end
        do
          -- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC112: Confused about usage of register: R1 in 'UnsetPending'

          if l_0_6 ~= nil and l_0_8 ~= nil and is_valid_ip(l_0_8) == nil and (string.find)(l_0_8, "/bin/bash", 1, true) == nil and (string.find)(l_0_8, "/bin/sh", 1, true) == nil and (string.find)(l_0_8, "/bin/zsh", 1, true) == nil and (string.find)(l_0_8, "sh -i", 1, true) == nil then
            return mp.CLEAN
          end
          local l_0_18 = nil
          -- DECOMPILER ERROR at PC129: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC135: Confused about usage of register: R2 in 'UnsetPending'

          if (bm.get_imagepath)() ~= nil and (bm.get_imagepath)() ~= "" and l_0_10 ~= nil then
            (bm.trigger_sig)("GenericReverseShell", (bm.get_imagepath)(), l_0_10)
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

