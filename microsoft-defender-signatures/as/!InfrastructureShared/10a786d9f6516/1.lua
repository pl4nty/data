-- Threat: !InfrastructureShared
-- Name: 10a786d9f6516
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
