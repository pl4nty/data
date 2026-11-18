-- Threat: !InfrastructureShared
-- Name: 4c789fe6a581
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
if hstrlog[2].matched then
  mp.ReportLowfi(l_0_0, 807438412)
end
if not mp.get_mpattribute("SIGATTR:SideLoad:ZOOM_DLLCHK") then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
MpCommon.SetOriginalFileName(l_0_0, string.format("BM_%s", "BrokenCoaster.A"))
return mp.INFECTED
