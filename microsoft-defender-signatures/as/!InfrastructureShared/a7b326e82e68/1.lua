-- Threat: !InfrastructureShared
-- Name: a7b326e82e68
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
if l_0_0 ~= nil then
  local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, ".([^.]+)$")
  if l_0_3 ~= nil and string.match(l_0_3, "dll") == nil and string.match(l_0_3, "ocx") == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
