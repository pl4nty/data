-- Threat: !InfrastructureShared
-- Name: 119d701a2514d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
local l_0_2 = {"w3wp.exe"}
if not IsProcNameInParentProcessTree("cmdhstr", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = l_0_1:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_3 then
  local l_0_4 = true
  for l_0_5 in l_0_3:gmatch("%d+") do
    if tonumber(l_0_5) > 255 then
      l_0_4 = false
      break
    end
  end
  if l_0_4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
