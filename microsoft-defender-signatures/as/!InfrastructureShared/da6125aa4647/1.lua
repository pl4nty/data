-- Threat: !InfrastructureShared
-- Name: da6125aa4647
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
