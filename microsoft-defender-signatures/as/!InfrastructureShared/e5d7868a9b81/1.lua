-- Threat: !InfrastructureShared
-- Name: e5d7868a9b81
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if not l_0_1 then
  return mp.CLEAN
end
for l_0_2 in l_0_1:gmatch("(%d+%.%d+%.%d+%.%d+)") do
  local l_0_3 = {}
  for l_0_4 in l_0_2:gmatch("(%d+)") do
    table.insert(l_0_3, l_0_4)
  end
  if #l_0_3 == 4 then
    for l_0_5, l_0_6 in ipairs(l_0_3) do
      local l_0_7 = tonumber(l_0_6)
      if 1 < #l_0_6 and l_0_6:match("^0%d") or 255 < l_0_7 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
