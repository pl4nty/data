-- Threat: !InfrastructureShared
-- Name: 69b366a8b09b
-- Type: 21

if this_sigattrlog[4].matched then
  local l_0_0 = this_sigattrlog[4].utf8p1
  if l_0_0 ~= nil and 4 < string.len(l_0_0) and string.sub(l_0_0, -4) == ".lnk" then
    local l_0_1 = string.match(l_0_0, "([^\\]+)$")
    if l_0_1 == nil then
      return mp.CLEAN
    end
    local l_0_2 = string.len(l_0_1)
    if l_0_2 <= 3 or 15 < l_0_2 then
      return mp.CLEAN
    end
    if string.find(l_0_1, " ", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
