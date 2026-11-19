-- Threat: !InfrastructureShared
-- Name: 113b3801514e3
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  if not string.find(l_0_0, "c:\\program files", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
