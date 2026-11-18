-- Threat: !InfrastructureShared
-- Name: !#Lua:FileModuleNotInCleanContext.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: BM_MZ_DLL & RPF:TopLevelFile

if mp.get_mpattribute("Exclusion:IsPotentialSideLoad.A") == true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 and #l_0_0 < 3 then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_0) == false then
  return mp.INFECTED
end
return mp.CLEAN
