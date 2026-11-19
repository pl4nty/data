-- Threat: !InfrastructureShared
-- Name: 176b3f1aed950
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "msdt.exe" or l_0_1:match("([^\\]+)$") == "sihost.exe" or l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_1:match("([^\\]+)$") == "systemsettings.exe" or l_0_1:match("([^\\]+)$") == "runtimebroker.exe" or l_0_1:match("([^\\]+)$") == "svchost.exe" or l_0_1:match("([^\\]+)$") == "pcwrun.exe" or l_0_1:match("([^\\]+)$") == "interop.exe" then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
