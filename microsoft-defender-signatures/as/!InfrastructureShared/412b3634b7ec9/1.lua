-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\412b3634b7ec9\1.luac 

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
        if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
          local l_0_2, l_0_5 = nil
        end
        -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

        do
          if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
            local l_0_6 = nil
          end
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R2 in 'UnsetPending'

          if nil and nil then
            local l_0_7, l_0_8 = nil
            if not pcall(string.match, nil, "regionsize:(%d+)") or isnull(R7_PC73) then
              return mp.CLEAN
            end
            local l_0_9, l_0_10 = nil
            local l_0_11 = nil
            -- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

            -- DECOMPILER ERROR at PC86: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC95: Overwrote pending register: R6 in 'AssignReg'

            -- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC103: Overwrote pending register: R6 in 'AssignReg'

            -- DECOMPILER ERROR at PC104: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC110: Confused about usage of register: R6 in 'UnsetPending'

            -- DECOMPILER ERROR at PC112: Unhandled construct in 'MakeBoolean' P3

            if ((versioning.GetProcessorArchitecture)() == 0 and (versioning.GetProcessorArchitecture)() ~= 9) or not (this_sigattrlog[1]).matched or nil then
              local l_0_12, l_0_13 = nil
              if not pcall(sysio.GetPEVersionInfo, nil) or isnull(R12_PC116) then
                return mp.CLEAN
              end
              local l_0_14 = R7_PC73
              local l_0_15 = nil
              local l_0_16 = nil
              if isnull((sysio.GetPEVersionInfo).OriginalFilename) or isnull(R12_PC116) or isnull((sysio.GetPEVersionInfo).FileVersion) then
                return mp.CLEAN
              end
              ;
              (bm.add_related_string)("PRODUCT VERSION: ", R12_PC116, bm.RelatedStringBMReport)
              -- DECOMPILER ERROR at PC153: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (bm.add_related_string)("FILE VERSION: ", (sysio.GetPEVersionInfo).FileVersion, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("ARCH: ", l_0_14, bm.RelatedStringBMReport)
            end
            do
              do
                -- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

                -- DECOMPILER ERROR at PC168: Overwrote pending register: R12 in 'AssignReg'

                -- DECOMPILER ERROR at PC169: Overwrote pending register: R12 in 'AssignReg'

                ;
                (bm.add_related_string)("PATCHED BYTES: ", l_0_12, R12_PC116)
                -- DECOMPILER ERROR at PC175: Overwrote pending register: R12 in 'AssignReg'

                -- DECOMPILER ERROR at PC176: Overwrote pending register: R12 in 'AssignReg'

                ;
                (bm.add_related_string)("MALCIOUS PATH: ", l_0_10, R12_PC116)
                do return mp.INFECTED end
                return mp.CLEAN
              end
            end
          end
        end
      end
    end
  end
end

