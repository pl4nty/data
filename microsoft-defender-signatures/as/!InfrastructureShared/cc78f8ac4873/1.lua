-- Threat: !InfrastructureShared
-- Name: cc78f8ac4873
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and pesecs[3].Name == ".data" and pesecs[3].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
