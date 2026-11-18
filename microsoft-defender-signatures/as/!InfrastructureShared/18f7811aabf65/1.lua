-- Threat: !InfrastructureShared
-- Name: 18f7811aabf65
-- Type: 21

local l_0_0 = {"sync.dat", "agent.json"}
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_2 = l_0_1:match("^(.*\\)")
for l_0_3, l_0_4 in ipairs(l_0_0) do
  local l_0_5 = l_0_2 .. l_0_4
  if sysio.IsFileExists(l_0_5) then
    mp.ReportLowfi(l_0_5, 2247976272)
  end
end
return mp.INFECTED
