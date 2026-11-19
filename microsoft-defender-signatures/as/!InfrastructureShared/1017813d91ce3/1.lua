-- Threat: !InfrastructureShared
-- Name: 1017813d91ce3
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
