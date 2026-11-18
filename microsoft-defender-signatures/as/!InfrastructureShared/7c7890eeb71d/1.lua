-- Threat: !InfrastructureShared
-- Name: 7c7890eeb71d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
