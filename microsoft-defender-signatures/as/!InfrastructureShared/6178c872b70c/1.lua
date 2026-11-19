-- Threat: !InfrastructureShared
-- Name: 6178c872b70c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
