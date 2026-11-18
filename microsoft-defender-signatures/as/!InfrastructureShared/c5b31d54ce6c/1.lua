-- Threat: !InfrastructureShared
-- Name: c5b31d54ce6c
-- Type: 21

local l_0_0 = false
local l_0_1 = 0
local l_0_2 = ""
local l_0_3 = string.lower(bm.get_imagepath())
if l_0_3 and string.find(l_0_3, "explorer.exe", 1, true) then
  l_0_0 = true
end
if this_sigattrlog[1].matched then
  l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1))
  if l_0_2 ~= nil and (string.find(l_0_2, "\\Downloads\\", 1, true) or string.find(l_0_2, "\\Temp\\", 1, true) or string.find(l_0_2, ".zip", 1, true)) then
    l_0_1 = l_0_1 + 1
  end
end
if this_sigattrlog[2].matched then
  l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1))
  if l_0_2 ~= nil and (string.find(l_0_2, "\\Downloads\\", 1, true) or string.find(l_0_2, "\\Temp\\", 1, true) or string.find(l_0_2, ".zip", 1, true)) then
    l_0_1 = l_0_1 + 1
  end
end
if this_sigattrlog[3].matched then
  l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1))
  if l_0_2 ~= nil and (string.find(l_0_2, "\\Downloads\\", 1, true) or string.find(l_0_2, "\\Temp\\", 1, true) or string.find(l_0_2, ".zip", 1, true)) then
    l_0_1 = l_0_1 + 1
  end
end
if l_0_0 and 0 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
