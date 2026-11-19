-- Threat: !InfrastructureShared
-- Name: 33d77f38b866
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.match(l_0_0.image_path, "\\([^\\]+)$")
  l_0_1 = string.lower(l_0_1)
  if l_0_1 == "msiexec.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
