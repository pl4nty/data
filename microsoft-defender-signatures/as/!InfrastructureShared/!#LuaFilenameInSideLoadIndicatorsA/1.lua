-- Threat: !InfrastructureShared
-- Name: !#Lua:FilenameInSideLoadIndicators.A
-- Type: 12
-- Includes: TechniqueTracker
-- MpAttributes: BM_MZ_DLL

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if isFilenameInSideLoadIndicators(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
