-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScanXNpmPkgTarballA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.GetMachineGUID)())
if l_0_0 ~= "f90a3875-96f0-4baf-a510-c70f8796892b" then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("^upload_%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED

