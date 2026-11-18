-- Threat: !InfrastructureShared
-- Name: 51d71b68b8bf
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.match(l_0_1, "echo%s+(['\"]?)([A-Za-z0-9+/]+=*)%1%s*%|")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 ~= nil and l_0_4.image_path ~= "" and string.find(l_0_4.image_path, "postgres", -8, true) then
  return mp.INFECTED
end
return mp.CLEAN
