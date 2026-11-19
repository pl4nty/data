-- Threat: !InfrastructureShared
-- Name: d2b3069281a2
-- Type: 21

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  local l_0_1 = l_0_0:match("/c ([^\\].*)")
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  local l_0_2 = string.lower(this_sigattrlog[7].utf8p2)
  if l_0_2 ~= nil then
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
return mp.INFECTED
