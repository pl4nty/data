-- Threat: !InfrastructureShared
-- Name: !#SLF:Susp.Turla.SA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "msmime.dll" or l_0_0 == "schedctl.dll" then
  return mp.INFECTED
end
return mp.CLEAN
