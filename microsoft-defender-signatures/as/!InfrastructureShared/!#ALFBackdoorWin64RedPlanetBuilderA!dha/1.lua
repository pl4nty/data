-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win64/RedPlanetBuilder.A!dha
-- Type: 9

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and l_0_0.OriginalFilename == "MarsRatBuilder.exe" and l_0_0.ProductName == "MarsRatBuilder" and l_0_0.FileVersion == "0.0.0.0" then
  return mp.INFECTED
end
return mp.CLEAN
