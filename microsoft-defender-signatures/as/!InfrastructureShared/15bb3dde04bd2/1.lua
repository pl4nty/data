-- Threat: !InfrastructureShared
-- Name: 15bb3dde04bd2
-- Type: 21
-- Includes: BMLuaLib

if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_0:match("([^\\]+)$"))
  local l_0_3 = string.lower(l_0_1:match("([^\\]+)$"))
  if l_0_2 == l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
