-- Threat: !InfrastructureShared
-- Name: 55d71a6691d1
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "mshta.exe" or l_0_1:match("([^\\]+)$") == "svchost.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
