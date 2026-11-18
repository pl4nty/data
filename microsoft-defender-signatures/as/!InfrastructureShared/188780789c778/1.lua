-- Threat: !InfrastructureShared
-- Name: 188780789c778
-- Type: 21

if peattributes.ismsil == true and pesecs[4].Name == ".bss" and pesecs[4].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
