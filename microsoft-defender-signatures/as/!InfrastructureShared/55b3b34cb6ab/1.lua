-- Threat: !InfrastructureShared
-- Name: 55b3b34cb6ab
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "\\udcofficeaddin2000.dll", 1, true) or string.find(l_0_1, "\\microsoft.bdd.utility.dll", 1, true) or string.find(l_0_1, "\\mscal.ocx", 1, true) then
    return mp.CLEAN
  end
  if l_0_0 ~= nil and 3 < string.len(l_0_0) then
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_2 ~= nil then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
        bm.add_related_file(l_0_4)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
