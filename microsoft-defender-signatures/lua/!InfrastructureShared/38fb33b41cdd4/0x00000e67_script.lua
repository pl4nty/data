-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\38fb33b41cdd4\0x00000e67_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[7]).matched then
  local l_0_0, l_0_4 = nil, nil
else
  do
    do
      if (this_sigattrlog[8]).matched then
        local l_0_1, l_0_5 = , (string.lower)((this_sigattrlog[8]).utf8p1)
      end
      -- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

      do
        if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
          local l_0_2, l_0_6 = nil
        end
        if nil then
          do
            if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 and (this_sigattrlog[4]).matched then
              local l_0_3, l_0_7 = nil
            end
            -- DECOMPILER ERROR at PC86: Confused about usage of register: R3 in 'UnsetPending'

            if (this_sigattrlog[4]).utf8p2 then
              local l_0_8 = nil
              if isnull((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)")) then
                return mp.CLEAN
              end
              local l_0_9 = nil
              if (string.match)((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)"), "^https?://") then
                local l_0_10, l_0_11 = nil
                if (mp.CheckUrl)((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)")) == 1 and (string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)") == 1 then
                  return mp.CLEAN
                end
                local l_0_12 = nil
                local l_0_13 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "IRL_ALLOCVMREMOTE_SETTHREADCONTEXT"}
                if ((SafeGetUrlReputation({l_0_12}, l_0_13, false, 3000)).urls)[l_0_12] and (((SafeGetUrlReputation({l_0_12}, l_0_13, false, 3000)).urls)[l_0_12]).determination == 2 and (((SafeGetUrlReputation({l_0_12}, l_0_13, false, 3000)).urls)[l_0_12]).confidence >= 60 then
                  local l_0_14 = nil
                  if not pcall(string.match, l_0_10, "vmbaseaddress:(%d+)") or isnull(R12_PC150) then
                    return mp.CLEAN
                  end
                  -- DECOMPILER ERROR at PC158: Overwrote pending register: R12 in 'AssignReg'

                  local l_0_15, l_0_16 = nil
                  if not pcall(R12_PC150, l_0_10, "vmbytescopied:(%d+)") or isnull(R14_PC166) then
                    return mp.CLEAN
                  end
                  local l_0_17, l_0_18 = nil
                  local l_0_19 = nil
                  -- DECOMPILER ERROR at PC178: Overwrote pending register: R13 in 'AssignReg'

                  -- DECOMPILER ERROR at PC179: Overwrote pending register: R14 in 'AssignReg'

                  -- DECOMPILER ERROR at PC188: Overwrote pending register: R13 in 'AssignReg'

                  -- DECOMPILER ERROR at PC189: Overwrote pending register: R14 in 'AssignReg'

                  -- DECOMPILER ERROR at PC196: Overwrote pending register: R13 in 'AssignReg'

                  -- DECOMPILER ERROR at PC197: Overwrote pending register: R14 in 'AssignReg'

                  -- DECOMPILER ERROR at PC203: Confused about usage of register: R13 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC205: Unhandled construct in 'MakeBoolean' P3

                  if ((versioning.GetProcessorArchitecture)() == 0 and (versioning.GetProcessorArchitecture)() ~= 9) or not (this_sigattrlog[7]).matched or nil then
                    local l_0_20, l_0_21 = R12_PC150
                    if not pcall(sysio.GetPEVersionInfo, nil) or isnull(R19_PC209) then
                      return mp.CLEAN
                    end
                    local l_0_22 = R14_PC166
                    local l_0_23 = nil
                    local l_0_24 = nil
                    if isnull((sysio.GetPEVersionInfo).OriginalFilename) or isnull(R19_PC209) or isnull((sysio.GetPEVersionInfo).FileVersion) then
                      return mp.CLEAN
                    end
                    local l_0_25 = nil
                    -- DECOMPILER ERROR at PC238: Confused about usage of register: R20 in 'UnsetPending'

                    ;
                    (bm.set_detection_string)(safeJsonSerialize({product_version = R19_PC209, file_version = (sysio.GetPEVersionInfo).FileVersion, arch_str = l_0_22, sizeof_shellcode = l_0_20, address_of_shellcode = l_0_18, dest_url = l_0_12}))
                    ;
                    (bm.add_related_string)("PRODUCT VERSION: ", R19_PC209, bm.RelatedStringBMReport)
                    -- DECOMPILER ERROR at PC259: Confused about usage of register: R20 in 'UnsetPending'

                    ;
                    (bm.add_related_string)("FILE VERSION: ", (sysio.GetPEVersionInfo).FileVersion, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("ARCH: ", l_0_22, bm.RelatedStringBMReport)
                  end
                  do
                    do
                      -- DECOMPILER ERROR at PC274: Overwrote pending register: R19 in 'AssignReg'

                      -- DECOMPILER ERROR at PC275: Overwrote pending register: R19 in 'AssignReg'

                      ;
                      (bm.add_related_string)("SHELLCODE BYTES: ", l_0_20, R19_PC209)
                      -- DECOMPILER ERROR at PC281: Overwrote pending register: R19 in 'AssignReg'

                      -- DECOMPILER ERROR at PC282: Overwrote pending register: R19 in 'AssignReg'

                      ;
                      (bm.add_related_string)("SHELLCODE ADDRESS: ", l_0_18, R19_PC209)
                      -- DECOMPILER ERROR at PC288: Overwrote pending register: R19 in 'AssignReg'

                      -- DECOMPILER ERROR at PC289: Overwrote pending register: R19 in 'AssignReg'

                      ;
                      (bm.add_related_string)("MALICIOUS URL: ", l_0_12, R19_PC209)
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
    end
  end
end

