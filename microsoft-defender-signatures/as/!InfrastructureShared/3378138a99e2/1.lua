-- Threat: !InfrastructureShared
-- Name: 3378138a99e2
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
