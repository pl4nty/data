-- Threat: !InfrastructureShared
-- Name: 5dd7a3eaff3b
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_2 then
  local l_0_3 = true
  for l_0_4 in l_0_2:gmatch("%d+") do
    if tonumber(l_0_4) > 255 then
      l_0_3 = false
      break
    end
  end
  if l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
