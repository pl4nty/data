-- Threat: !InfrastructureShared
-- Name: 4db349654f90
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\userprofilemigrationservice.exe", 1, true) or string.find(l_0_0, "\\transwiz.exe", 1, true) or string.find(l_0_0, "\\msiexec.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
