-- Threat: !InfrastructureShared
-- Name: d1b3dc5b3f77
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      if string.find(".txt", string.sub(string.lower(l_0_3), -4), 1, true) or string.find(".zip", string.sub(string.lower(l_0_3), -4), 1, true) then
        bm.add_threat_file(l_0_3)
      else
        mp.ReportLowfi(l_0_3, 2503435772)
        bm.add_related_file(l_0_3)
      end
    end
  end
end
return mp.INFECTED
