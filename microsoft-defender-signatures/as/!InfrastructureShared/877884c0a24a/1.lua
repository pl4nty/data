-- Threat: !InfrastructureShared
-- Name: 877884c0a24a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/Strictor.AMCV") then
  return mp.INFECTED
end
return mp.CLEAN
