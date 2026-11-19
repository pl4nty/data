-- Threat: !InfrastructureShared
-- Name: e17834821cbe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
