-- Threat: !InfrastructureShared
-- Name: 767808f77e7b
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_PATH)
if l_0_0 then
  local l_0_1 = sysio.FindFiles(l_0_0, "*.pdb", 4)
  if l_0_1 then
    for l_0_2, l_0_3 in pairs(l_0_1) do
      mp.ReportLowfi(l_0_3, 3390914334)
    end
  end
end
return mp.INFECTED
