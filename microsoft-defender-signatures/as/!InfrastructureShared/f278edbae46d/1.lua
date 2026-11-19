-- Threat: !InfrastructureShared
-- Name: f278edbae46d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and pesecs[6].Name == "TqwuH" and pesecs[6].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
