-- Threat: !InfrastructureShared
-- Name: 84b3ce7a801c
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\windows auditing\\current\\winaudit.exe", 1, true) then
    return mp.CLEAN
  elseif string.find(l_0_0, "\\windows auditing\\current\\winaudit_standalone.exe", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
