-- Threat: !InfrastructureShared
-- Name: 43d71034a011
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid):lower()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_1:find("-r .\\preflight.js .\\app.jsc", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
