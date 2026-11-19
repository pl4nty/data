-- Threat: !InfrastructureShared
-- Name: 9178d0acfb64
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
