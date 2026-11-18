-- Threat: !InfrastructureShared
-- Name: 7578ec798e9b
-- Type: 21

if pe.get_versioninfo().InternalName == "Bluthmon.exe" and pe.get_versioninfo().CompanyName == "Mototech.co" then
  return mp.INFECTED
end
return mp.LOWFI
