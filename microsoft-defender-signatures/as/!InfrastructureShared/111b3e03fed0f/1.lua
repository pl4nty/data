-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\111b3e03fed0f\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and (string.find)(l_0_0, "-ap \"", 1, true) then
    local l_0_2, l_0_4, l_0_5 = ((string.lower)(l_0_0)):match("-ap \"([^\"]+)\"")
  else
    do
      do
        local l_0_3 = nil
        if (bm.get_current_process_startup_info)() ~= nil and ((bm.get_current_process_startup_info)()).command_line ~= nil then
          l_0_3 = ((string.lower)(((bm.get_current_process_startup_info)()).command_line)):match("-ap \"([^\"]+)\"")
        end
        -- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_3 == nil then
          return mp.CLEAN
        end
        local l_0_6 = nil
        local l_0_7 = nil
        if ((ExtractDeviceProperties()).DeviceRoles and ((ExtractDeviceProperties()).DeviceRoles).SharePointServer ~= nil) or IsSharepointServer() then
          local l_0_8 = nil
          local l_0_9 = "C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\15\\TEMPLATE\\LAYOUTS"
          -- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

          -- DECOMPILER ERROR at PC79: Overwrote pending register: R1 in 'AssignReg'

          if ((sysio.IsFolderExists)(l_0_9) and not (sysio.IsFolderExists)("C:\\Program Files\\Common Files\\microsoft shared\\Web Server Extensions\\16\\TEMPLATE\\LAYOUTS")) or l_0_7 == nil then
            return mp.CLEAN
          end
          ;
          (mp.TriggerScanResource)("folder", l_0_7)
          local l_0_10 = nil
          for l_0_14,l_0_15 in pairs((sysio.FindFiles)(l_0_7, "*.aspx", 0)) do
            local l_0_11 = nil
            -- DECOMPILER ERROR at PC102: Confused about usage of register: R10 in 'UnsetPending'

            ;
            (mp.ReportLowfi)(R10_PC102, 2037457591)
          end
          return mp.INFECTED
        end
        do
          local l_0_16 = nil
          if (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config") == nil or (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config") == "" then
            return mp.CLEAN
          end
          local l_0_17 = nil
          if (MpCommon.GetIisInstallPaths)((MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")) == nil or (MpCommon.GetIisInstallPaths)((MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")) == "" then
            return mp.CLEAN
          end
          local l_0_18 = nil
          local l_0_19 = false
          local l_0_20 = false
          do
            local l_0_21 = "["
            for l_0_25,l_0_26 in ipairs(l_0_18) do
              local l_0_22 = ""
              -- DECOMPILER ERROR at PC142: Confused about usage of register: R13 in 'UnsetPending'

              -- DECOMPILER ERROR at PC145: Confused about usage of register: R13 in 'UnsetPending'

              -- DECOMPILER ERROR at PC148: Confused about usage of register: R13 in 'UnsetPending'

              -- DECOMPILER ERROR at PC151: Confused about usage of register: R13 in 'UnsetPending'

              -- DECOMPILER ERROR at PC156: Confused about usage of register: R13 in 'UnsetPending'

              -- DECOMPILER ERROR at PC161: Confused about usage of register: R13 in 'UnsetPending'

              if (2037457591).PoolName ~= nil and (2037457591).PoolName ~= "" and (2037457591).Path ~= nil and (2037457591).Path ~= "" and (string.lower)((2037457591).PoolName) == l_0_6 then
                l_0_21 = l_0_21 .. (2037457591).Path .. "|"
                -- DECOMPILER ERROR at PC167: Confused about usage of register: R13 in 'UnsetPending'

                ;
                (mp.TriggerScanResource)("folder", (2037457591).Path)
                -- DECOMPILER ERROR at PC171: Confused about usage of register: R13 in 'UnsetPending'

                local l_0_28 = (sysio.FindFiles)((2037457591).Path, "*.aspx", -1)
                local l_0_29 = (sysio.FindFiles)(l_0_27.Path, "*.asp", -1)
                local l_0_30 = (sysio.FindFiles)(l_0_27.Path, "*.ashx", -1)
                local l_0_31 = (sysio.FindFiles)(l_0_27.Path, "*.jsp", -1)
                local l_0_32 = (sysio.FindFiles)(l_0_27.Path, "*.php", -1)
                -- DECOMPILER ERROR at PC209: Confused about usage of register: R19 in 'UnsetPending'

                if (sysio.IsFileExists)(l_0_27.Path .. "\\web.config") then
                  l_0_22 = l_0_22 .. l_0_27.Path .. "\\web.config" .. "|"
                  l_0_20 = true
                end
                local l_0_33 = nil
                if merge_tables(l_0_28, l_0_29, l_0_30, l_0_31, l_0_32) then
                  l_0_19 = true
                  for l_0_37,l_0_38 in pairs(merge_tables(l_0_28, l_0_29, l_0_30, l_0_31, l_0_32)) do
                    local l_0_34 = nil
                    -- DECOMPILER ERROR at PC229: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC238: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC247: Confused about usage of register: R25 in 'UnsetPending'

                    if (string.find)(l_0_32, "\\owa\\auth\\errorFE.aspx", 1, true) == nil and (string.find)(l_0_32, "\\ecp\\auth\\TimeoutLogout.aspx", 1, true) == nil then
                      (mp.ReportLowfi)(l_0_32, 2037457591)
                    end
                  end
                end
              end
            end
            if l_0_20 then
              (bm.trigger_sig)("webconfig_paths", l_0_22)
            end
            if l_0_19 then
              l_0_21 = l_0_21 .. "]"
              ;
              (bm.add_related_string)("webshellpaths", l_0_21, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC279: Confused about usage of register R13 for local variables in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

