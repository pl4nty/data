-- Threat: !InfrastructureShared
-- Name: 1827869e8c8f4
-- Type: 21

if peattributes.isvbnative == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
