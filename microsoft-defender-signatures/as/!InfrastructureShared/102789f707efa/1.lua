-- Threat: !InfrastructureShared
-- Name: 102789f707efa
-- Type: 21

if peattributes.isexe and peattributes.headerchecksum0 then
  return mp.INFECTED
end
return mp.CLEAN
