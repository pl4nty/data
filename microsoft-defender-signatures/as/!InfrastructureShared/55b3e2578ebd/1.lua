-- Threat: !InfrastructureShared
-- Name: 55b3e2578ebd
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) and string.find(".hta", string.sub(string.lower(l_0_3), -4), 1, true) then
      bm.add_threat_file(l_0_3)
    end
  end
end
return mp.INFECTED
