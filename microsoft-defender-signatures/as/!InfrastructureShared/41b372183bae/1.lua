-- Threat: !InfrastructureShared
-- Name: 41b372183bae
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = l_0_0:match("sys[tw][eo][mw][36][24]\\([^\\]+)")
  local l_0_2 = {
    tasks = true,
    drivers = true,
    driverstore = true,
    driverstate = true,
    config = true
  }
  if l_0_2[l_0_1] then
    return mp.CLEAN
  end
end
return mp.INFECTED
