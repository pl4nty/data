-- Threat: !InfrastructureShared
-- Name: 82b37dadaadd
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil then
    local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if sysio.IsFileExists(l_0_3) and string.find(l_0_3, "rundll32", 1, true) == nil then
        bm.add_related_file(l_0_3)
      end
    end
  end
end
return mp.INFECTED
