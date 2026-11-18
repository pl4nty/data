-- Threat: !InfrastructureShared
-- Name: 55b35b4429a9
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if l_0_0 ~= nil and 3 < string.len(l_0_0) and string.find(l_0_0, " copy ", 1, true) and string.find(l_0_0, "\\windows\\temp\\", 1, true) and (string.find(l_0_0, "\\share$\\", 1, true) or string.find(l_0_0, " \\\\", 1, true) or string.find(l_0_0, " \"\"\\\\", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
