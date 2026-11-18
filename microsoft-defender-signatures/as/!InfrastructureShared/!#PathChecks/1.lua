-- Threat: !InfrastructureShared
-- Name: !#PathChecks
-- Type: 11
-- MpAttributes: Lua:FileNameAvgWscDll

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\avg\\", 1, true) then
  mp.set_mpattribute("Lua:InAvgFolder")
end
l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_PATH)
if l_0_0 then
  local l_0_1 = sysio.FindFiles(l_0_0, "*.pdb", 4)
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      mp.ReportLowfi(l_0_3, 3390914334)
    end
  end
end
return mp.CLEAN
