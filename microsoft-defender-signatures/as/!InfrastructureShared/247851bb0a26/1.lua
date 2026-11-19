-- Threat: !InfrastructureShared
-- Name: 247851bb0a26
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.INFECTED
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 then
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME))
  local l_0_3 = l_0_2 and l_0_2:match("^(.+)%.[^.]+$")
  if l_0_1 and l_0_1 ~= "" and l_0_3 and l_0_3 ~= "." and l_0_3 ~= ".." then
    local l_0_4 = l_0_1:gsub("[\\/]+$", "") .. "\\" .. l_0_3
    if sysio.IsFileExists(l_0_4) then
      mp.ReportLowfi(l_0_4, 337104832)
    end
  end
end
return mp.INFECTED
