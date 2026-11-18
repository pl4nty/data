-- Threat: !InfrastructureShared
-- Name: efd7fb321ff2
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 < 100 or 1250 < #l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = 0
for l_0_3 in l_0_1:gmatch(l_0_1, "set ") do
  l_0_2 = l_0_2 + 1
end
if l_0_2 < 2 then
  return mp.CLEAN
end
if l_0_1:match("![%w_]+!![%w_]+!") then
  return mp.INFECTED
end
local l_0_4 = 0
for l_0_5 in l_0_1:gmatch("![%w_]+!") do
  l_0_4 = l_0_4 + 1
end
if 2 < l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
