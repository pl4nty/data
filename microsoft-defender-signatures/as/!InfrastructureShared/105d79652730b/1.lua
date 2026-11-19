-- Threat: !InfrastructureShared
-- Name: 105d79652730b
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("^%S+%s+%S+%s+(%S+)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6 = l_0_2:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
if not l_0_3 then
  return mp.CLEAN
end
for l_0_7, l_0_8 in ipairs({
  l_0_3,
  l_0_4,
  l_0_5,
  l_0_6
}) do
  local l_0_9 = tonumber(l_0_8)
  if not l_0_9 or l_0_9 < 0 or 255 < l_0_9 then
    return mp.CLEAN
  end
end
local l_0_10 = l_0_1:match("^%S+%s+%S+%s+%S+%s+(%S+)")
if not l_0_10 then
  return mp.CLEAN
end
l_0_10 = tonumber(l_0_10)
if l_0_10 < 0 or 65535 < l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED
