-- Threat: !InfrastructureShared
-- Name: 35b3f2fd2635
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0
  local l_0_1 = string.lower(bm.get_imagepath())
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  end
  if l_0_1:find("appvclient%.exe") ~= nil then
    return mp.CLEAN
  end
  if l_0_0 ~= nil then
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
      if sysio.IsFileExists(l_0_4) then
        bm.add_related_file(l_0_4)
      end
    end
  end
end
return mp.INFECTED
