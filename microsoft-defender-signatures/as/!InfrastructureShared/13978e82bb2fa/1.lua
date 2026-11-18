-- Threat: !InfrastructureShared
-- Name: 13978e82bb2fa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
