-- Threat: !InfrastructureShared
-- Name: 95b3cb995797
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
