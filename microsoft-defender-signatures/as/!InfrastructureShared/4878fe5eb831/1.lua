-- Threat: !InfrastructureShared
-- Name: 4878fe5eb831
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.hasappendeddata and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
