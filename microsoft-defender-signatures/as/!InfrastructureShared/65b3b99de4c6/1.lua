-- Threat: !InfrastructureShared
-- Name: 65b3b99de4c6
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if l_0_0 ~= nil and string.find(l_0_0, "//b", 1, true) and string.find(l_0_0, "//e:jscript", 1, true) then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  local l_0_2, l_0_3
  for l_0_4, l_0_5 in ipairs(l_0_1) do
    l_0_2 = mp.ContextualExpandEnvironmentVariables("%temp%\\") .. l_0_5
    l_0_3 = mp.ContextualExpandEnvironmentVariables("%temp%\\low\\") .. l_0_5
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
      mp.ReportLowfi(l_0_5, 3307547556)
    elseif sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
      mp.ReportLowfi(l_0_2, 3307547556)
    elseif sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
      mp.ReportLowfi(l_0_3, 3307547556)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
