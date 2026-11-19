-- Threat: !InfrastructureShared
-- Name: 2bb33046b35c
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 8 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "cpassword", 1, true) and string.find(l_0_1, "\\\\", 1, true) and (string.find(l_0_1, "/i", 1, true) or string.find(l_0_1, "-i", 1, true)) and string.find(l_0_1, "policies", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
