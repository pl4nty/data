-- Threat: !InfrastructureShared
-- Name: a3b316da6fef
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\windows fabric", 1, true) or string.find(l_0_0, "\\microsoft.net", 1, true) or string.find(l_0_0, "\\binn\\polybase\\mpdwsvc.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
