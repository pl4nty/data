-- Threat: !InfrastructureShared
-- Name: d540e3ca77ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
