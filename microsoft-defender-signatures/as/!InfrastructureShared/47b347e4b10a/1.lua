-- Threat: !InfrastructureShared
-- Name: 47b347e4b10a
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if not string.find(l_0_3, "\\cmd.exe", 1, true) and not string.find(l_0_3, "\\svchost.exe", 1, true) and not string.find(l_0_3, "\\winrshost.exe", 1, true) and not string.find(l_0_3, "\\bcryptprimitives.dll", 1, true) and l_0_3 ~= nil and string.len(l_0_3) > 3 and sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
