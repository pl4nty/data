-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\128_1962.luac 

-- params : ...
-- function num : 0
local l_0_8 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = nil
else
  do
    -- DECOMPILER ERROR at PC46: Overwrote pending register: R0 in 'AssignReg'

    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p2 ~= nil then
      do
        local l_0_2, l_0_4, l_0_6 = l_0_8, l_0_0, 0
        l_0_4 = (string.lower)((this_sigattrlog[3]).utf8p1) or ""
        -- DECOMPILER ERROR at PC56: freeLocal<0 in 'ReleaseLocals'

        -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

        local l_0_7 = nil
        if l_0_4:match("\\services\\(.-)\\\\") == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

        if (l_0_4:match("\\services\\(.-)\\\\")):find("^aarsvc_") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

        if (l_0_4:match("\\services\\(.-)\\\\")):find("^mpksl") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

        if (l_0_4:match("\\services\\(.-)\\\\")):find("^procexp") then
          return mp.CLEAN
        end
        local l_0_9 = nil
        if ("|googlechromeelevationservice|microsoftedgeelevationservice|onedrive updater service|windowsazureguestagent|"):find(l_0_9, 1, true) then
          return mp.CLEAN
        end
        if l_0_7 ~= nil then
          local l_0_10 = nil
          for l_0_14,l_0_15 in ipairs((mp.GetExecutablesFromCommandLine)(l_0_7)) do
            local l_0_11, l_0_12 = nil
            -- DECOMPILER ERROR at PC112: Confused about usage of register: R9 in 'UnsetPending'

            R9_PC112 = (mp.ContextualExpandEnvironmentVariables)(R9_PC112)
            if (string.find)(R9_PC112, "c:\\programdata", 1, true) then
              return mp.CLEAN
            else
              if (string.find)(R9_PC112, "c:\\program files", 1, true) then
                return mp.CLEAN
              else
                if (string.find)(R9_PC112, "c:\\progra~", 1, true) then
                  return mp.CLEAN
                else
                  if (string.find)(R9_PC112, "c:\\windowsazure\\", 1, true) then
                    return mp.CLEAN
                  else
                    if (string.find)(R9_PC112, "c:\\windows\\", 1, true) then
                      if (string.find)(R9_PC112, "c:\\windows\\system", 1, true) then
                        return mp.CLEAN
                      else
                        if (string.find)(R9_PC112, "c:\\windows\\syswow64", 1, true) then
                          return mp.CLEAN
                        else
                          if (string.find)(R9_PC112, "\\assembly\\nativeimages", 1, true) then
                            return mp.CLEAN
                          else
                            if (string.find)(R9_PC112, "\\winsxs", 1, true) then
                              return mp.CLEAN
                            else
                              if (string.find)(R9_PC112, "\\servicing", 1, true) then
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
            if (sysio.IsFileExists)(R9_PC112) then
              (bm.add_related_file)(R9_PC112)
              l_0_10 = l_0_10 + 1
            end
          end
        end
        do
          local l_0_16 = nil
          if (MpCommon.GetPersistContextNoPath)("ServiceCreationScript") then
            for l_0_20,l_0_21 in ipairs((MpCommon.GetPersistContextNoPath)("ServiceCreationScript")) do
              local l_0_17 = nil
              -- DECOMPILER ERROR at PC265: Confused about usage of register: R9 in 'UnsetPending'

              -- DECOMPILER ERROR at PC271: Confused about usage of register: R9 in 'UnsetPending'

              if (sysio.IsFileExists)(R9_PC112) then
                (bm.add_related_file)(R9_PC112)
              end
            end
          end
          do
            if l_0_10 > 0 then
              return mp.INFECTED
            end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

