-- Threat: !InfrastructureShared
-- Name: !#Lua:ScanXNpmPkgTarball.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_GZIP_FILE

local l_0_0 = string.lower(mp.GetMachineGUID())
if l_0_0 ~= "f90a3875-96f0-4baf-a510-c70f8796892b" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("^upload_%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED
