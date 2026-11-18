-- Threat: !InfrastructureShared
-- Name: 31784b892e5b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
