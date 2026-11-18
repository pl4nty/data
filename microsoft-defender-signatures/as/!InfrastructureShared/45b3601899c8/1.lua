-- Threat: !InfrastructureShared
-- Name: 45b3601899c8
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= "" then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "maccount ", 1, true) and string.find(l_0_0, "dc ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
