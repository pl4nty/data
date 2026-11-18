-- Threat: !InfrastructureShared
-- Name: 3878ef07e36b
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".didat" and pesecs[4].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
