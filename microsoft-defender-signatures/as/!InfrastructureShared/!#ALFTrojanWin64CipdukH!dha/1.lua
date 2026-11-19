-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/Cipduk.H!dha
-- Type: 10
-- MpAttributes: HSTR:CipdukLoader

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL) .. "mui"
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 4215686520)
end
return mp.CLEAN
