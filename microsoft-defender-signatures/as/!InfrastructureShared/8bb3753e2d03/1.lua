-- Threat: !InfrastructureShared
-- Name: 8bb3753e2d03
-- Type: 21

local l_0_0 = bm.get_connection_string()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "Uri=([^;]*);")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "://([^/:]+%.kr)/")
if l_0_2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
