-- Threat: !InfrastructureShared
-- Name: 143786f56b6e9
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.sub(l_0_0, -13) == "uninstall.exe" or string.sub(l_0_0, -15) == "uninstaller.exe" then
  return mp.CLEAN
end
return mp.INFECTED
