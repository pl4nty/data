-- Threat: !InfrastructureShared
-- Name: 55b3d714ac5d
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  l_0_0 = string.lower(l_0_0)
  l_0_1 = string.lower(l_0_1)
  if l_0_0:find("\\appdata\\", 1, true) then
    local l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
    local l_0_3 = l_0_1:match("(.+\\)([^\\]+)$")
    if l_0_2 == l_0_3 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
