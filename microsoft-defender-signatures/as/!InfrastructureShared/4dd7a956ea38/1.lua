-- Threat: !InfrastructureShared
-- Name: 4dd7a956ea38
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("powershell.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
