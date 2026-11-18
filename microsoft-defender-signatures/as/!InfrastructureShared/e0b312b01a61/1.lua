-- Threat: !InfrastructureShared
-- Name: e0b312b01a61
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 ~= nil then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "\\windows\\sys", 1, true) == nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
