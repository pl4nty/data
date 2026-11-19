-- Threat: !InfrastructureShared
-- Name: 55b313f8f4fe
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.match(this_sigattrlog[1].utf8p1, "\\([^\\]+)$")
  if l_0_0 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "$normal.dot", 1, true) or string.sub(l_0_1, 1, 4) == "~wrd" or string.sub(l_0_1, 1, 2) == "~$" then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
