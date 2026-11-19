-- Threat: !InfrastructureShared
-- Name: 65b34b406704
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0:match("\\([^\\]+)$"))
  local l_0_2 = {
    ["microsoft.com"] = true
  }
  if l_0_2[l_0_1] then
    return mp.INFECTED
  end
end
return mp.CLEAN
