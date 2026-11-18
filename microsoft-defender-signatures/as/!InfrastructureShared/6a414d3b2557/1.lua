-- Threat: !InfrastructureShared
-- Name: 6a414d3b2557
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = mp.GetProcessCommandLine(l_0_0)
  if l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "winmgmt", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
