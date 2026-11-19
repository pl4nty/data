-- Threat: !InfrastructureShared
-- Name: 7bd7290c74a1
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_1 ~= nil and l_0_1.ppid ~= nil and l_0_1.image_path ~= nil then
  if string.find(l_0_1.image_path, "php-fpm", 1, true) or string.find(l_0_1.image_path, "apache2", 1, true) then
    return mp.INFECTED
  end
  local l_0_2 = mp.GetParentProcInfo(l_0_1.ppid)
  if l_0_2 ~= nil and l_0_2.ppid ~= nil and (string.find(l_0_2.image_path, "php-fpm", 1, true) or string.find(l_0_2.image_path, "apache2", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
