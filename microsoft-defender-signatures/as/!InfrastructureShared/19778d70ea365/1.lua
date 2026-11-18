-- Threat: !InfrastructureShared
-- Name: 19778d70ea365
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
