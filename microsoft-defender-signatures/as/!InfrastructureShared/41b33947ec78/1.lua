-- Threat: !InfrastructureShared
-- Name: 41b33947ec78
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables("%userprofile%"))
  local l_0_2 = string.lower(l_0_0)
  if string.find(l_0_2, l_0_1 .. "\\[^\\]+$") and string.find(l_0_0, "\\%l%l%l+%.exe$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
