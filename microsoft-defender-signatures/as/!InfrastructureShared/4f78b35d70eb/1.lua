-- Threat: !InfrastructureShared
-- Name: 4f78b35d70eb
-- Type: 21

if peattributes.x86_image == true and (peattributes.isdll == true or peattributes.isexe == true) then
  return mp.INFECTED
end
return mp.CLEAN
