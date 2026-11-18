-- Threat: !InfrastructureShared
-- Name: 45b3c19c6820
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  if not string.find(string.lower(l_0_0), " /u ", 1, true) or not string.find(string.lower(l_0_0), "/logfile= ", 1, true) then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "/installstatedir=", 1, true) or string.find(string.lower(l_0_0), "microsoft.dynamics.", 1, true) or string.find(string.lower(l_0_0), "microsoft.management.", 1, true) or string.find(string.lower(l_0_0), "windowsfabric", 1, true) or string.find(string.lower(l_0_0), "deployment", 1, true) or string.find(string.lower(l_0_0), "upmWmi", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      mp.ReportLowfi(l_0_3, 2023886462)
      bm.add_related_file(l_0_3)
    end
  end
end
bm.add_action("EmsScan", 3000)
return mp.INFECTED
