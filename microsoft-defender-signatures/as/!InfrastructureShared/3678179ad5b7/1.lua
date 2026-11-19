-- Threat: !InfrastructureShared
-- Name: 3678179ad5b7
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/LummaC.G") then
  return mp.INFECTED
end
return mp.CLEAN
