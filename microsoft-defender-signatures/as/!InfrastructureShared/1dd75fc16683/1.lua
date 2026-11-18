-- Threat: !InfrastructureShared
-- Name: 1dd75fc16683
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and l_0_0.ppid ~= nil and string.find(l_0_0.image_path, "/bin/bash", 1, true) then
  local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.image_path ~= nil and l_0_1.ppid ~= nil and string.find(l_0_1.image_path, "/opt/attackiq/agent/engine/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
