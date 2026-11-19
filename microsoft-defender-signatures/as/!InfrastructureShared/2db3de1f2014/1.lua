-- Threat: !InfrastructureShared
-- Name: 2db3de1f2014
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      end
    end
  end
end
add_parents()
return mp.INFECTED
