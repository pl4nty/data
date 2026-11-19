-- Threat: !InfrastructureShared
-- Name: 77b3860f0976
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if l_0_0 ~= nil and (string.find(l_0_0, "intune-staff", 1, true) or string.find(l_0_0, "get-localuser", 1, true)) then
    return mp.CLEAN
  end
end
return mp.INFECTED
