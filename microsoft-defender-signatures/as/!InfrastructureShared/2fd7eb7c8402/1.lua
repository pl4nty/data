-- Threat: !InfrastructureShared
-- Name: 2fd7eb7c8402
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
local l_0_2, l_0_3 = l_0_1:match("(https?)://(%d+%.%d+%.%d+%.%d+)(:?%d*)(/?[%w%._~%-%?%#%[%]@!%$&'%(%)%*%+,;=:]*)")
if l_0_2 and l_0_3 then
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
if l_0_1:match("[%w%-%.]+%.page") then
  return mp.INFECTED
end
return mp.CLEAN
