-- Threat: \xac!AcidBox.SD
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & HSTR:AcidBox_SSP_DLL_Export

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "msv1_1.dll" or l_0_0 == "pku.dll" or l_0_0 == "windigest.dll" then
  return mp.INFECTED
end
return mp.CLEAN
