-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a816_5177.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  do
    if l_1_0 < tonumber((string.format)("%.f", l_1_0)) then
      local l_1_1 = tonumber((string.format)("%.f", l_1_0)) - 1
    end
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    return l_1_1
  end
end

if (versioning.GetHostOsType)() == 1 then
  local l_0_2 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_1 = {}
  for l_2_5 = 1, 4 do
    local l_2_8, l_2_9 = nil
    l_2_8 = string
    l_2_8 = l_2_8.char
    l_2_9 = l_2_0 % 256
    l_2_8 = l_2_8(l_2_9)
    l_2_1[l_2_5] = l_2_8
    l_2_8 = l_0_0
    l_2_9 = l_2_0 / 256
    local l_2_11 = nil
    l_2_8 = l_2_8(l_2_9)
    local l_2_10 = nil
    l_2_0 = l_2_8
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  local l_2_6 = table.concat
  local l_2_7 = l_2_1
  do return l_2_6(l_2_7) end
  -- DECOMPILER ERROR at PC20: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end

  local l_0_3 = "-1.0"
  local l_0_4 = "false"
  local l_0_5 = "0.001"
  local l_0_6 = "-1.0"
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R6 in 'AssignReg'

  if (versioning.GetPlatformRing)() == versioning.PLATFORM_RING_0_INTERNAL then
    (database.AddStudyId)("Lua_Np_Ring0")
    ;
    (database.AddStudyId)("NP_EspReputationMode")
  else
    -- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC43: Overwrote pending register: R6 in 'AssignReg'

    if (versioning.GetPlatformRing)() == versioning.PLATFORM_RING_1_PRERELEASE then
      (database.AddStudyId)("Lua_Np_Ring1")
      ;
      (database.AddStudyId)("NP_EspReputationMode")
    else
      -- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R2 in 'AssignReg'

      if (versioning.GetPlatformRing)() == versioning.PLATFORM_RING_2_PREVIEW then
        (database.AddStudyId)("Lua_Np_Ring2")
        ;
        (database.AddStudyId)("NP_EspReputationMode")
      else
        -- DECOMPILER ERROR at PC78: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC79: Overwrote pending register: R2 in 'AssignReg'

        if (versioning.GetPlatformRing)() == versioning.PLATFORM_RING_3_STAGED then
          (database.AddStudyId)("NP_EspReputationMode")
          ;
          (database.AddStudyId)("Lua_Np_Ring3")
        else
          -- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC90: Overwrote pending register: R2 in 'AssignReg'

          ;
          (database.AddStudyId)("Lua_Np_Ring4")
        end
      end
    end
  end
  if (versioning.GetPlatform)() == 6 and (versioning.GetPlatformVersion)() == 19 and (versioning.GetPlatformBuild)() >= 1576796160 then
    (database.AddStudyId)("Lua_Np_Bugfix49119667_Enabled")
  end
  -- DECOMPILER ERROR at PC125: Overwrote pending register: R2 in 'AssignReg'

  if (versioning.GetProcessorArchitecture)() ~= 9 or (versioning.GetOsVersion)() < 393220 then
    (database.AddStudyId)("Lua_Np_ESP_Disabled")
  end
  -- DECOMPILER ERROR at PC145: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R2 in 'AssignReg'

  if (versioning.GetPlatform)() == 6 and (versioning.GetPlatformVersion)() == 19 and (versioning.GetPlatformBuild)() < 1574830080 then
    (database.AddStudyId)("Lua_Np_OutdatedPlatform")
  end
  local l_0_7 = "-1.0"
  -- DECOMPILER ERROR at PC160: Overwrote pending register: R3 in 'AssignReg'

  if (string.lower)((versioning.GetOrgID)()) == "b6aaaa9f-ffc6-4541-bbc4-e59910ea2bbb" then
    (database.AddStudyId)("Lua_Np_Cx_Bugfix49119667_Disable")
  end
  -- DECOMPILER ERROR at PC167: Overwrote pending register: R2 in 'AssignReg'

  if (string.lower)((versioning.GetOrgID)()) == "e58fe2bf-860a-4320-865d-8258efbe7148" then
    (database.AddStudyId)("Lua_Np_Cx_ESP_Disable")
  end
  local l_0_8 = nil
  ;
  (database.LoadDBVar)(database.DBVAR_ARRAY_WIDESTRINGN, "NpSettings", {"{ " .. "\"enableBugfix49119667\" : " .. l_0_4 .. ", " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 1.0, " .. "\"npPerfMetricsThrottle\" : 0.05, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"enableSelfHealTelemetryThrottle\" : " .. l_0_5 .. ", " .. "\"enableUsoSupportThrottle\" : " .. l_0_6 .. ", " .. "\"enableEcsConfigurationThrottle\" : " .. l_0_7 .. ", " .. "\"resourceAssignmentThrottle\" : 0.1, " .. "\"durationTelemetryThrottle\": 1.0, " .. "\"remoteMetadataTelemetryThrottle\": 1.0, " .. "\"disableQuicInspectionThrottle\" : 1.0, " .. "\"networkProtectionReputationModeThrottle\" : " .. l_0_3 .. "}"}, 1, 1)
else
  do
    -- DECOMPILER ERROR at PC215: Overwrote pending register: R2 in 'AssignReg'

    if (l_0_3.GetHostOsType)() == 2 then
      local l_0_9 = nil
      -- DECOMPILER ERROR at PC221: Overwrote pending register: R3 in 'AssignReg'

      local l_0_10 = "-1.0"
      -- DECOMPILER ERROR at PC222: Overwrote pending register: R4 in 'AssignReg'

      local l_0_11 = l_0_4
      -- DECOMPILER ERROR at PC223: Overwrote pending register: R5 in 'AssignReg'

      if (l_0_6.GetEngineRing)() == versioning.ENGINE_RING_0_INTERNAL then
        l_0_10 = "1.0"
        l_0_11 = "1.0"
        -- DECOMPILER ERROR at PC232: Overwrote pending register: R4 in 'AssignReg'

        ;
        (database.AddStudyId)("Lua_Np_Ring0_Mac")
        ;
        (database.AddStudyId)("NP_EspReputationMode_Mac")
      else
        if (versioning.GetEngineRing)() == versioning.ENGINE_RING_1_PRERELEASE then
          l_0_10 = "1.0"
          l_0_11 = "-1.0"
          -- DECOMPILER ERROR at PC251: Overwrote pending register: R4 in 'AssignReg'

          ;
          (database.AddStudyId)("Lua_Np_Ring1_Mac")
          ;
          (database.AddStudyId)("NP_EspReputationMode_Mac")
        else
          -- DECOMPILER ERROR at PC268: Overwrote pending register: R4 in 'AssignReg'

          if (versioning.GetEngineRing)() == versioning.ENGINE_RING_2_PREVIEW then
            (database.AddStudyId)("Lua_Np_Ring2_Mac")
            ;
            (database.AddStudyId)("NP_EspReputationMode_Mac")
          else
            if (versioning.GetEngineRing)() == versioning.ENGINE_RING_3_STAGED then
              (database.AddStudyId)("Lua_Np_Ring3_Mac")
            else
              ;
              (database.AddStudyId)("Lua_Np_Ring4_Mac")
            end
          end
        end
      end
      local l_0_12 = l_0_5
      if (string.lower)((versioning.GetOrgID)()) == "24d4a9cf-e7f1-400a-b2d4-bd534e1e168d" or (string.lower)((versioning.GetOrgID)()) == "8a2d9a03-1cd7-4b6a-9e63-6fb98b8c0e7a" or (string.lower)((versioning.GetOrgID)()) == "9d61afa0-cfa4-4746-95af-dc897a6f6774" or (string.lower)((versioning.GetOrgID)()) == "da82a2d8-0d12-41a6-b3dc-3b010c59f54a" or (string.lower)((versioning.GetOrgID)()) == "3df8d417-1b4f-4b75-b289-5c016058832c" or (string.lower)((versioning.GetOrgID)()) == "73a99e52-c380-4b86-9d47-fe1cb231f222" then
        l_0_10 = "1.0"
        ;
        (database.AddStudyId)("Lua_Np_Mitre_Mac")
      end
      if (string.lower)((versioning.GetOrgID)()) == "b41bba0c-ccde-47e8-9c3e-0fda11a55690" then
        l_0_10 = "1.0"
        ;
        (database.AddStudyId)("Lua_Np_PublicPreview_Mac")
      else
        if (versioning.GetEngineRing)() == versioning.ENGINE_RING_2_PREVIEW and ((string.lower)((versioning.GetOrgID)()) == "25fd1e67-95d2-47ae-8506-e16bd5e40975" or (string.lower)((versioning.GetOrgID)()) == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7") then
          l_0_10 = "1.0"
          ;
          (database.AddStudyId)("Lua_Np_PublicPreview_Mac_InsiderFast")
        end
      end
      local l_0_13 = nil
      local l_0_14 = "{ " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : " .. l_0_10 .. ", " .. "\"enableHealthCheckReset\" : false, " .. "\"enableHealthCheckResetCleanThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 0, " .. "\"npPerfMetricsThrottle\" : 0, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"enableVerdictCallbackModeThrottle\": " .. l_0_11 .. ", " .. "\"networkProtectionReputationModeThrottle\" : " .. l_0_12 .. ", " .. "\"enableKernelVolumeQueriesThrottle\" : 1.0, " .. "\"kernelVolumeQueryFrequency\" : 1000 " .. "}"
      local l_0_15 = nil
      l_0_15[#{} + 1] = l_0_9(1) .. l_0_9(#l_0_14 + 1)
      for i = 1, #l_0_14 do
        l_0_15[#l_0_15 + 1] = l_0_14:sub(l_0_19, l_0_19) .. "\000"
      end
      l_0_15[#l_0_15 + 1] = "\000\000"
      ;
      (database.LoadDBVar)(database.DBVAR_RAW, "NpSettings", (table.concat)(l_0_15), 1, 1)
    else
      do
        if (versioning.GetHostOsType)() == 3 then
          local l_0_20 = nil
          local l_0_21 = "{ " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 0, " .. "\"npPerfMetricsThrottle\" : 0, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"networkProtectionReputationModeThrottle\" : -1.0 " .. "}"
          do
            local l_0_22 = nil
            l_0_22[#{} + 1] = l_0_20(1) .. l_0_20(#l_0_21 + 1)
            for i = 1, #l_0_21 do
              l_0_22[#l_0_22 + 1] = l_0_21:sub(l_0_26, l_0_26) .. "\000"
            end
            l_0_22[#l_0_22 + 1] = "\000\000"
            ;
            (database.LoadDBVar)(database.DBVAR_RAW, "NpSettings", (table.concat)(l_0_22), 1, 1)
            -- DECOMPILER ERROR at PC468: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

