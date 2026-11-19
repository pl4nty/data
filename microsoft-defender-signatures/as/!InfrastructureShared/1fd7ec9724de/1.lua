-- Threat: !InfrastructureShared
-- Name: 1fd7ec9724de
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= "base64 -d" then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2.image_path, "xpcproxy com.", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
