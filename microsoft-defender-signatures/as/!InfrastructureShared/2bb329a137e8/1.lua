-- Threat: !InfrastructureShared
-- Name: 2bb329a137e8
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\svchost.exe", 1, true) or string.find(string.lower(l_0_0), "\\installshield\\setup.exe", 1, true) or string.find(string.lower(l_0_0), "\\installshield\\x32\\setup.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
