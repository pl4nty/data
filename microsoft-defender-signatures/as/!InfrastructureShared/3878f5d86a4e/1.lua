-- Threat: !InfrastructureShared
-- Name: 3878f5d86a4e
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("TEL:Trojan:Win32/Kovter_Config") then
  return mp.INFECTED
end
return mp.CLEAN
