-- Threat: !InfrastructureShared
-- Name: 7878dceaa06b
-- Type: 21

if peattributes.ismsil and peattributes.hasappendeddata and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
