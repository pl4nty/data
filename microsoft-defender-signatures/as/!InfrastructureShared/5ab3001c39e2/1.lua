-- Threat: !InfrastructureShared
-- Name: 5ab3001c39e2
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "/s ", 1, true) and string.find(l_0_0, "/n ", 1, true) and string.find(l_0_0, "-net ", 1, true) and string.find(l_0_0, "-size ", 1, true) and string.find(l_0_0, "-nomutex ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
