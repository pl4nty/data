-- Threat: !InfrastructureShared
-- Name: 3f7827c8e60d
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/Tedy.AMCV") then
  return mp.INFECTED
end
return mp.CLEAN
