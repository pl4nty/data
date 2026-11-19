-- Threat: !InfrastructureShared
-- Name: 15078dbe8b0c3
-- Type: 21

if hstrlog == nil then
  return mp.CLEAN
end

local function l_0_0(l_1_0)
  return l_1_0 ~= nil and l_1_0.matched
end

if not l_0_0(hstrlog[7]) or not l_0_0(hstrlog[8]) then
  return mp.CLEAN
end
if not l_0_0(hstrlog[1]) and not l_0_0(hstrlog[2]) and not l_0_0(hstrlog[3]) then
  return mp.CLEAN
end
if not l_0_0(hstrlog[4]) and not l_0_0(hstrlog[5]) and not l_0_0(hstrlog[6]) then
  return mp.CLEAN
end
return mp.INFECTED
