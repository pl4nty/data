-- Threat: !InfrastructureShared
-- Name: 79d79c3a6fad
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and l_0_0.ppid ~= nil and string.find(l_0_0.image_path, "/opt/attackiq/agent/engine/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
