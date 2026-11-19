-- Threat: !InfrastructureShared
-- Name: 1c0786d0d1613
-- Type: 21

if (peattributes.isexe and peattributes.ismsil and peattributes.no_security) == true then
  return mp.INFECTED
end
return mp.CLEAN
