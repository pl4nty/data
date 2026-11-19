-- Threat: !InfrastructureShared
-- Name: 175d7e7244c9c
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("microsoft.dcaas.domainhealthmonitor.exe") or l_0_1:find("agentservice.exe") then
    return mp.CLEAN
  end
end
return mp.INFECTED
