-- Threat: !InfrastructureShared
-- Name: 4078d9ef4f26
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_PATH)
if l_0_0 and l_0_0 ~= "" then
  local l_0_1 = ""
  local l_0_2 = "setting.dat"
  if string.sub(l_0_0, -1) == "\\" then
    l_0_1 = l_0_0 .. l_0_2
  else
    l_0_1 = l_0_0 .. "\\" .. l_0_2
  end
  if sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 2130772754)
  end
end
return mp.INFECTED
