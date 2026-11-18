-- Threat: !InfrastructureShared
-- Name: f5d775a06efc
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and string.find(l_0_0.image_path, "/cron", -6, true) then
  return mp.INFECTED
end
return mp.CLEAN
