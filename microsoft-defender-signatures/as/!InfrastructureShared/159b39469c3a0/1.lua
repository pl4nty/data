-- Threat: !InfrastructureShared
-- Name: 159b39469c3a0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].utf8p2
  if l_0_2 and l_0_1 and string.find(string.lower(l_0_2), "tcpip6.hiv", -20, true) and string.find(string.lower(l_0_1), "networx", -20, true) then
    return mp.CLEAN
  end
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p2
end
if l_0_2 then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  if l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      bm.add_related_file(l_0_5)
    end
  end
end
if l_0_0 then
  local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_6 then
    for l_0_7, l_0_8 in ipairs(l_0_6) do
      bm.add_related_file(l_0_8)
    end
  end
end
add_parents()
return mp.INFECTED
