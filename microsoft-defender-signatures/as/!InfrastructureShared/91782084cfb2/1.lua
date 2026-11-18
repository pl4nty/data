-- Threat: !InfrastructureShared
-- Name: 91782084cfb2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
