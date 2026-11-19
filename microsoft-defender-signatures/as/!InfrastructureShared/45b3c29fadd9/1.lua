-- Threat: !InfrastructureShared
-- Name: 45b3c29fadd9
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\rubyw.exe", 1, true) or string.find(l_0_0, "\\sccm_wmi_repair.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
