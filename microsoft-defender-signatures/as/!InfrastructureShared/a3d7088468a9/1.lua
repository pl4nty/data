-- Threat: !InfrastructureShared
-- Name: a3d7088468a9
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\windows\\explorer.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
