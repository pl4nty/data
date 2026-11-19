-- Threat: !InfrastructureShared
-- Name: 34784e6afca1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
