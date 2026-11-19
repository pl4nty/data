-- Threat: !InfrastructureShared
-- Name: 35b360341329
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
        if string.find(l_0_3, ".bat", -4, true) then
          bm.add_threat_file(l_0_3)
        end
      end
    end
  end
end
add_parents()
return mp.INFECTED
