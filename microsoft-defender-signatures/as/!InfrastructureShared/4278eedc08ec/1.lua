-- Threat: !InfrastructureShared
-- Name: 4278eedc08ec
-- Type: 21

if peattributes.isdll == true and pesecs[2].Name == ".rodata" and pesecs[2].Characteristics == 1610612768 then
  return mp.INFECTED
end
return mp.CLEAN
