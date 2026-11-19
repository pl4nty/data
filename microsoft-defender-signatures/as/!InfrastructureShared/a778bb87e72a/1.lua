-- Threat: !InfrastructureShared
-- Name: a778bb87e72a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
