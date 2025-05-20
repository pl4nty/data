-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a81f_3048.luac 

-- params : ...
-- function num : 0
local l_0_0 = 26100
if (versioning.GetSafeReleaseRing)() == 200 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_0_INTERNAL, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_0_INTERNAL, 1)
  ;
  (database.AddStudyId)("LUA-RR0-OptInV2")
  return 
end
if (versioning.GetSafeReleaseRing)() == 1 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_1_PRERELEASE, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_1_PRERELEASE, 1)
  ;
  (database.AddStudyId)("LUA-RR1-OptInV2")
  return 
end
if (versioning.GetSafeReleaseRing)() == 2 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_2_PREVIEW, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_2_PREVIEW, 1)
  ;
  (database.AddStudyId)("LUA-RR2-OptInV2")
  return 
end
if (versioning.GetSafeReleaseRing)() == 3 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_3_STAGED, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_3_STAGED, 1)
  ;
  (database.AddStudyId)("LUA-RR3-OptInV2")
  return 
end
if (versioning.IsBeta)() and (versioning.GetPlatform)() == 6 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_1_PRERELEASE, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_1_PRERELEASE, 1)
  ;
  (database.AddStudyId)("LUA-RR1-BetaV2")
  return 
end
if (versioning.GetPlatform)() == 6 and (versioning.GetOsVersion)() > 393219 and l_0_0 < (versioning.GetOsBuildNumber)() and (MpCommon.IsSampled)(83911080, false, true, true) then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_1_PRERELEASE, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_1_PRERELEASE, 1)
  ;
  (database.AddStudyId)("LUA-RR1-InsidersV2")
  return 
end
if (versioning.GetPlatform)() == 6 and (versioning.GetPvpRing)() > 0 and (versioning.GetPvpRing)() < 10000 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_1_PRERELEASE, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_1_PRERELEASE, 1)
  ;
  (database.AddStudyId)("LUA-RR1-SUVPV2")
  return 
end
local l_0_1 = (versioning.GetOfficeConfigRing)()
if l_0_1 == 0 or l_0_1 == 1 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_1_PRERELEASE, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_1_PRERELEASE, 1)
  if l_0_1 == 0 then
    (database.AddStudyId)("LUA-RR1-OfficeRing0_DogfoodCanary_Selected")
  else
    ;
    (database.AddStudyId)("LUA-RR1-OfficeRing1_DogfoodMain_Selected")
  end
  return 
end
if (versioning.IsMSFT)() and (versioning.GetPlatform)() == 6 and (MpCommon.IsSampled)(83896080, false, true, true) then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_2_PREVIEW, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_2_PREVIEW, 1)
  ;
  (database.AddStudyId)("LUA-RR2-MSFTV2")
  return 
end
if (versioning.GetPlatform)() == 6 and l_0_0 < (versioning.GetOsBuildNumber)() and (MpCommon.IsSampled)(83936080, false, true, true) then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_2_PREVIEW, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_2_PREVIEW, 1)
  ;
  (database.AddStudyId)("LUA-RR2-InsidersV2")
  return 
end
if (versioning.GetPlatform)() == 6 and (MpCommon.IsSampled)(83886580, false, true, true) then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_2_PREVIEW, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_2_PREVIEW, 1)
  ;
  (database.AddStudyId)("LUA-RR2-LimitedV2")
  return 
end
local l_0_2 = (MpCommon.IsSampled)(25000, false, true, true)
if l_0_1 == 5 and l_0_2 then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_2_PREVIEW, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_2_PREVIEW, 1)
  ;
  (database.AddStudyId)("LUA-RR2-OfficeRing5_MicrosoftFork_Selected")
  return 
end
if l_0_1 == 5 and not l_0_2 then
  (database.AddStudyId)("LUA-RR2-OfficeRing5_MicrosoftFork_NotSelected")
end
if (versioning.GetPlatform)() == 6 and (MpCommon.IsSampled)(83896080, false, true, true) then
  (database.LoadDBVar)(database.DBVAR_DW, "MpEngineRing", versioning.ENGINE_RING_3_STAGED, 1)
  ;
  (database.LoadDBVar)(database.DBVAR_DW, "MpCampRing", versioning.PLATFORM_RING_3_STAGED, 1)
  ;
  (database.AddStudyId)("LUA-RR3-LimitedV2")
  return 
end
;
(database.AddStudyId)("LUA-RR-NotSelected")

