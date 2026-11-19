-- Threat: !InfrastructureShared
-- Name: NpSettings
-- Type: 23

local function l_0_0(l_1_0)
  local l_1_1 = tonumber(string.format("%.f", l_1_0))
  
  if l_1_0 < l_1_1 then
    l_1_1 = l_1_1 - 1
  end
  return l_1_1
end

local function l_0_1(l_2_0)
  local l_2_1 = {}
  for l_2_2 = 1, 4 do
    l_2_1[l_2_2] = string.char(l_2_0 % 256)
    l_2_0 = l_0_0(l_2_0 / 256)
  end
  return table.concat(l_2_1)
end

if versioning.GetHostOsType() == 1 then
  local l_0_2 = "-1.0"
  local l_0_3 = "false"
  local l_0_4 = "0.001"
  local l_0_5 = "-1.0"
  local l_0_6 = "-1.0"
  if versioning.GetPlatformRing() == versioning.PLATFORM_RING_0_INTERNAL then
    l_0_2 = "1.0"
    l_0_4 = "1.0"
    l_0_5 = "1.0"
    l_0_6 = "1.0"
    database.AddStudyId("Lua_Np_Ring0")
    database.AddStudyId("NP_EspReputationMode")
  elseif versioning.GetPlatformRing() == versioning.PLATFORM_RING_1_PRERELEASE then
    l_0_4 = "1.0"
    l_0_5 = "1.0"
    l_0_6 = "1.0"
    l_0_2 = "1.0"
    database.AddStudyId("NP_EspReputationMode")
    database.AddStudyId("Lua_Np_Ring1")
  elseif versioning.GetPlatformRing() == versioning.PLATFORM_RING_2_PREVIEW then
    l_0_5 = "1.0"
    l_0_6 = "1.0"
    database.AddStudyId("Lua_Np_Ring2")
    if versioning.IsSeville() then
      l_0_2 = "1.0"
      database.AddStudyId("NP_EspReputationMode")
    end
  elseif versioning.GetPlatformRing() == versioning.PLATFORM_RING_3_STAGED then
    l_0_5 = "1.0"
    l_0_6 = "1.0"
    database.AddStudyId("Lua_Np_Ring3")
    if versioning.IsSeville() then
      l_0_2 = "1.0"
      database.AddStudyId("NP_EspReputationMode")
    end
  else
    l_0_6 = "1.0"
    l_0_5 = "1.0"
    database.AddStudyId("Lua_Np_Ring4")
    if versioning.IsSeville() then
      l_0_2 = "1"
    end
  end
  if versioning.GetPlatform() == 6 and versioning.GetPlatformVersion() == 19 and versioning.GetPlatformBuild() >= 1576796160 then
    l_0_3 = "true"
    database.AddStudyId("Lua_Np_Bugfix49119667_Enabled")
  end
  if versioning.GetProcessorArchitecture() ~= 9 and versioning.GetPlatformRing() ~= versioning.PLATFORM_RING_0_INTERNAL and versioning.GetPlatformRing() ~= versioning.PLATFORM_RING_1_PRERELEASE or versioning.GetOsVersion() < 393220 then
    l_0_2 = "-1.0"
    database.AddStudyId("Lua_Np_ESP_Disabled")
  end
  if versioning.GetPlatform() == 6 and versioning.GetPlatformVersion() == 19 and versioning.GetPlatformBuild() < 1574830080 then
    l_0_3 = "false"
    l_0_5 = "-1.0"
    l_0_2 = "-1.0"
    database.AddStudyId("Lua_Np_OutdatedPlatform")
  end
  local l_0_7 = string.lower(versioning.GetOrgID())
  if l_0_7 == "b6aaaa9f-ffc6-4541-bbc4-e59910ea2bbb" then
    l_0_3 = "false"
    database.AddStudyId("Lua_Np_Cx_Bugfix49119667_Disable")
  end
  if l_0_7 == "e58fe2bf-860a-4320-865d-8258efbe7148" then
    l_0_2 = "-1.0"
    database.AddStudyId("Lua_Np_Cx_ESP_Disable")
  end
  if l_0_7 == "e9d9df27-a8d2-471f-982d-9a76770f3bd9" then
    l_0_6 = "1.0"
    database.AddStudyId("Lua_Np_Cx_ECS_Enable")
  end
  local l_0_8 = {
    "{ " .. "\"enableBugfix49119667\" : " .. l_0_3 .. ", " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 1.0, " .. "\"npPerfMetricsThrottle\" : 0.05, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"enableSelfHealTelemetryThrottle\" : " .. l_0_4 .. ", " .. "\"enableUsoSupportThrottle\" : " .. l_0_5 .. ", " .. "\"enableEcsConfigurationThrottle\" : " .. l_0_6 .. ", " .. "\"resourceAssignmentThrottle\" : 0.1, " .. "\"durationTelemetryThrottle\": 1.0, " .. "\"remoteMetadataTelemetryThrottle\": 1.0, " .. "\"disableQuicInspectionThrottle\" : 1.0, " .. "\"networkProtectionReputationModeThrottle\" : " .. l_0_2 .. "}"
  }
  database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRINGN, "NpSettings", l_0_8, 1, 1)
elseif versioning.GetHostOsType() == 2 then
  local l_0_9 = "-1.0"
  local l_0_10 = "-1.0"
  local l_0_11 = "-1.0"
  if versioning.GetEngineRing() == versioning.ENGINE_RING_0_INTERNAL then
    l_0_9 = "1.0"
    l_0_10 = "1.0"
    l_0_11 = "1.0"
    database.AddStudyId("Lua_Np_Ring0_Mac")
    database.AddStudyId("NP_EspReputationMode_Mac")
  elseif versioning.GetEngineRing() == versioning.ENGINE_RING_1_PRERELEASE then
    l_0_9 = "1.0"
    l_0_10 = "-1.0"
    l_0_11 = "1.0"
    database.AddStudyId("Lua_Np_Ring1_Mac")
    database.AddStudyId("NP_EspReputationMode_Mac")
  elseif versioning.GetEngineRing() == versioning.ENGINE_RING_2_PREVIEW then
    l_0_11 = "1.0"
    database.AddStudyId("Lua_Np_Ring2_Mac")
    database.AddStudyId("NP_EspReputationMode_Mac")
  elseif versioning.GetEngineRing() == versioning.ENGINE_RING_3_STAGED then
    database.AddStudyId("Lua_Np_Ring3_Mac")
  else
    database.AddStudyId("Lua_Np_Ring4_Mac")
  end
  local l_0_12 = string.lower(versioning.GetOrgID())
  if l_0_12 == "24d4a9cf-e7f1-400a-b2d4-bd534e1e168d" or l_0_12 == "8a2d9a03-1cd7-4b6a-9e63-6fb98b8c0e7a" or l_0_12 == "9d61afa0-cfa4-4746-95af-dc897a6f6774" or l_0_12 == "da82a2d8-0d12-41a6-b3dc-3b010c59f54a" or l_0_12 == "3df8d417-1b4f-4b75-b289-5c016058832c" or l_0_12 == "73a99e52-c380-4b86-9d47-fe1cb231f222" then
    l_0_9 = "1.0"
    database.AddStudyId("Lua_Np_Mitre_Mac")
  end
  if l_0_12 == "b41bba0c-ccde-47e8-9c3e-0fda11a55690" then
    l_0_9 = "1.0"
    database.AddStudyId("Lua_Np_PublicPreview_Mac")
  elseif versioning.GetEngineRing() == versioning.ENGINE_RING_2_PREVIEW and (l_0_12 == "25fd1e67-95d2-47ae-8506-e16bd5e40975" or l_0_12 == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7") then
    l_0_9 = "1.0"
    database.AddStudyId("Lua_Np_PublicPreview_Mac_InsiderFast")
  end
  local l_0_13 = "{ " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : " .. l_0_9 .. ", " .. "\"enableHealthCheckReset\" : false, " .. "\"enableHealthCheckResetCleanThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 0, " .. "\"npPerfMetricsThrottle\" : 0, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"enableVerdictCallbackModeThrottle\": " .. l_0_10 .. ", " .. "\"networkProtectionReputationModeThrottle\" : " .. l_0_11 .. ", " .. "\"enableKernelVolumeQueriesThrottle\" : 1.0, " .. "\"kernelVolumeQueryFrequency\" : 1000 " .. "}"
  local l_0_14 = {}
  l_0_14[#l_0_14 + 1] = l_0_1(1) .. l_0_1(#l_0_13 + 1)
  for l_0_15 = 1, #l_0_13 do
    l_0_14[#l_0_14 + 1] = l_0_13:sub(l_0_15, l_0_15) .. "\000"
  end
  l_0_14[#l_0_14 + 1] = "\000\000"
  database.LoadDBVar(database.DBVAR_RAW, "NpSettings", table.concat(l_0_14), 1, 1)
elseif versioning.GetHostOsType() == 3 then
  local l_0_16 = "{ " .. "\"volumeEventFrequency\" : 30, " .. "\"maxVolumeEvents\" : 10, " .. "\"volumeTelemetryTimeout\" : 60, " .. "\"allowSwitchToAsyncThrottle\" : 1.0, " .. "\"disableSmtpInspectionThrottle\" : 0, " .. "\"sendVolumeUpdatesThrottle\" : 0, " .. "\"enableNriMpEngineMetadataThrottle\" : 1.0, " .. "\"smartscreenLookupTimeThrottle\" : 0, " .. "\"npPerfMetricsThrottle\" : 0, " .. "\"enableConvertWarnToBlock\" : true, " .. "\"networkProtectionReputationModeThrottle\" : -1.0 " .. "}"
  local l_0_17 = {}
  l_0_17[#l_0_17 + 1] = l_0_1(1) .. l_0_1(#l_0_16 + 1)
  for l_0_18 = 1, #l_0_16 do
    l_0_17[#l_0_17 + 1] = l_0_16:sub(l_0_18, l_0_18) .. "\000"
  end
  l_0_17[#l_0_17 + 1] = "\000\000"
  database.LoadDBVar(database.DBVAR_RAW, "NpSettings", table.concat(l_0_17), 1, 1)
end
