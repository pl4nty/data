-- Threat: !InfrastructureShared
-- Name: e7b355b6b248
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.match(this_sigattrlog[1].utf8p1, "\\microsoft\\templates\\([^\\]+)$")
  if l_0_0 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "$normal.dot", 1, true) or string.find(l_0_1, "~wrd000", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
