-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\47eb3e9a80add\0x00000409_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched then
  local l_0_0, l_0_3 = nil, nil
else
  do
    do
      if (this_sigattrlog[2]).matched then
        local l_0_1, l_0_4 = , (string.lower)((this_sigattrlog[2]).utf8p1)
      end
      -- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

      do
        if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
          local l_0_2, l_0_5 = nil
        end
        -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

        if nil then
          local l_0_6, l_0_7 = nil
          if not pcall(string.match, nil, "vmbaseaddress:(%d+)") or isnull(R6_PC54) then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC62: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

          local l_0_8, l_0_9 = nil
          if not pcall(R6_PC54, nil, "vmbytescopied:(%d+)") or isnull(R8_PC70) then
            return mp.CLEAN
          end
          local l_0_10, l_0_11 = nil
          -- DECOMPILER ERROR at PC79: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC80: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC84: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC85: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

          if (l_0_6 and not l_0_7) or nil then
            local l_0_12, l_0_13 = R6_PC54
            if not pcall(sysio.GetPEVersionInfo, nil) or isnull(R12_PC97) then
              return mp.CLEAN
            end
            local l_0_14 = R8_PC70
            local l_0_15 = nil
            local l_0_16 = nil
            if isnull((sysio.GetPEVersionInfo).OriginalFilename) or isnull(R12_PC97) or isnull((sysio.GetPEVersionInfo).FileVersion) then
              return mp.CLEAN
            end
            ;
            (bm.add_related_string)("PRODUCT VERSION: ", R12_PC97, bm.RelatedStringBMReport)
            -- DECOMPILER ERROR at PC134: Confused about usage of register: R13 in 'UnsetPending'

            ;
            (bm.add_related_string)("FILE VERSION: ", (sysio.GetPEVersionInfo).FileVersion, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("ARCH: ", l_0_14, bm.RelatedStringBMReport)
          end
          do
            do
              -- DECOMPILER ERROR at PC149: Overwrote pending register: R12 in 'AssignReg'

              -- DECOMPILER ERROR at PC150: Overwrote pending register: R12 in 'AssignReg'

              ;
              (bm.add_related_string)("PATCHED BYTES: ", l_0_12, R12_PC97)
              -- DECOMPILER ERROR at PC156: Overwrote pending register: R12 in 'AssignReg'

              -- DECOMPILER ERROR at PC157: Overwrote pending register: R12 in 'AssignReg'

              ;
              (bm.add_related_string)("ETW ABSOLUTE PATCHED ADDRESS: ", l_0_10, R12_PC97)
              do return mp.INFECTED end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

