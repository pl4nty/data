-- Threat: !InfrastructureShared
-- Name: bbd7adc61c59
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "excel.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
