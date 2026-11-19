-- Threat: !InfrastructureShared
-- Name: 4c78208bb824
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
