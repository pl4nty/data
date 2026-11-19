-- Threat: !InfrastructureShared
-- Name: 2d7819028078
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/Taskun.AMAK!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
