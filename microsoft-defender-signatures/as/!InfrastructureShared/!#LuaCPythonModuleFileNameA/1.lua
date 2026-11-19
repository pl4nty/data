-- Threat: !InfrastructureShared
-- Name: !#Lua:CPythonModuleFileName.A
-- Type: 12
-- MpAttributes: BM_MZ_DLL

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:match("^python(3%d%d)%.dll$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
