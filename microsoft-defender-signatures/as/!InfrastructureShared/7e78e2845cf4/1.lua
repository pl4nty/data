-- Threat: !InfrastructureShared
-- Name: 7e78e2845cf4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
