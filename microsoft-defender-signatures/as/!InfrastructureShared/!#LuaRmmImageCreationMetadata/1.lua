-- Threat: !InfrastructureShared
-- Name: !#Lua:RmmImageCreationMetadata
-- Type: 13
-- Includes: RmmImageAgeTelemetryInfra
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & !BM_MZ_DLL

if Infrastructure_CacheRmmImageCreation() then
  return mp.INFECTED
end
return mp.CLEAN
