-- Threat: !InfrastructureShared
-- Name: 307826e890b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
