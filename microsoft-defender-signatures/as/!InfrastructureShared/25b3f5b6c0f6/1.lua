-- Threat: !InfrastructureShared
-- Name: 25b3f5b6c0f6
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_0, 1160269835)
return mp.INFECTED
