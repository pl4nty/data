-- Threat: !InfrastructureShared
-- Name: 7f782857057d
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
