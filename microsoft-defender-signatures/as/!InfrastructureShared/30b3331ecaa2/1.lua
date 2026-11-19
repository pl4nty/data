-- Threat: !InfrastructureShared
-- Name: 30b3331ecaa2
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\python", 1, true) then
    return mp.INFECTED
  end
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\microsoft vs code\\", 1, true) or string.find(l_0_0, "microsoft.watson", 1, true) or string.find(l_0_0, "mpsigstub.exe", 1, true) or string.find(l_0_0, "virtualboxvm.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
