-- Threat: !InfrastructureShared
-- Name: 15b34890650e
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\automationmanager.agentservice.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
