-- Threat: !InfrastructureShared
-- Name: 88b345cb5379
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[3].utf8p1
local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) then
    bm.add_related_file(l_0_4)
    mp.ReportLowfi(l_0_4, 1212861626)
  end
end
bm.add_related_file(l_0_0)
mp.ReportLowfi(l_0_0, 1212861626)
add_parents()
return mp.INFECTED
