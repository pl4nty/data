-- Threat: !InfrastructureShared
-- Name: 71b3be753d94
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\device\\harddiskvolume.\\windows\\system32\\ie4uinit%.exe", 1, false) ~= nil or string.find(l_0_0, "\\device\\harddiskvolume.\\windows\\syswow64\\ie4uinit%.exe", 1, false) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
