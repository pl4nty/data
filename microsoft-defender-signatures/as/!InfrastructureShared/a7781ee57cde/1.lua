-- Threat: !InfrastructureShared
-- Name: a7781ee57cde
-- Type: 21

if peattributes.ismsil and peattributes.hasappendeddata and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
