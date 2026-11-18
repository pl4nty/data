-- Threat: !InfrastructureShared
-- Name: 7578ca64c2a6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.get_mpattribute("NID:Trojan:Win32/Kelios.GD!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
