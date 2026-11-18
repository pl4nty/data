-- Threat: !InfrastructureShared
-- Name: 4fb3cd6be795
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = this_sigattrlog[3].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 7 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "nop", 1, true) and (string.find(l_0_1, "encoded", 1, true) or string.find(l_0_1, "bypass", 1, true)) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
