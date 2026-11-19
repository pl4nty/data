-- Threat: !InfrastructureShared
-- Name: 5278370a2ffd
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -13) == "uninstall.exe" or string.sub(l_0_0, -15) == "uninstaller.exe" then
  return mp.CLEAN
end
return mp.INFECTED
