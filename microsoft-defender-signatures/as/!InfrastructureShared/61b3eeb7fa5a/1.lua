-- Threat: !InfrastructureShared
-- Name: 61b3eeb7fa5a
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 9 then
    local l_0_1 = string.lower(l_0_0)
    if (string.find(l_0_1, "procdump", 1, true) or string.find(l_0_1, "accepteula", 1, true)) and string.match(l_0_1, "[%-/]m[acdkmp]") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
