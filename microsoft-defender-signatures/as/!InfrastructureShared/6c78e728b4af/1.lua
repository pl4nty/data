-- Threat: !InfrastructureShared
-- Name: 6c78e728b4af
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/Zilla.AMCY") then
  return mp.INFECTED
end
return mp.CLEAN
