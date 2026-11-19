-- Threat: !InfrastructureShared
-- Name: 9eb3dcff4089
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.match(this_sigattrlog[1].utf8p1, "\\([^\\]+)$")
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.match(this_sigattrlog[2].utf8p1, "\\([^\\]+)$")
end
if l_0_0 then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "%.xla") or string.find(l_0_1, "personal.xlsb") then
    return mp.INFECTED
  end
end
return mp.CLEAN
