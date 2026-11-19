-- Threat: !InfrastructureShared
-- Name: 65b3174459ce
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_1 = string.match(l_0_0, "%.exe\".+\"(.+%.wsf)")
  if l_0_1 ~= nil then
    l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
      mp.ReportLowfi(l_0_2, 927347397)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
