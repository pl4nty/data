-- Threat: !InfrastructureShared
-- Name: 61781d873bac
-- Type: 21

if peattributes.amd64_image == true and (peattributes.isdll == true or peattributes.isexe == true) then
  return mp.INFECTED
end
return mp.CLEAN
