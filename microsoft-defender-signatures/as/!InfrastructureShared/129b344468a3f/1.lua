-- Threat: !InfrastructureShared
-- Name: 129b344468a3f
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if string.find(l_0_0, " /change ", 1, true) and string.find(l_0_0, " /tn ", 1, true) and string.find(l_0_0, " /ru ", 1, true) and string.find(l_0_0, " /rp ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
