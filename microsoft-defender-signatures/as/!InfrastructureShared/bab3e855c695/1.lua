-- Threat: !InfrastructureShared
-- Name: bab3e855c695
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
end
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.utf8p2)
if not string.find(l_0_1, "curl", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "jsonrpc", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "result", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "xxd", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_1, "-r -p", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
