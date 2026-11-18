-- Threat: !InfrastructureShared
-- Name: 19b37afd65d0
-- Type: 21

local l_0_0
local l_0_1 = ".diagcab"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) and string.find(l_0_1, string.sub(l_0_4, -8), 1, true) then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
