-- Threat: !InfrastructureShared
-- Name: 34899d877609
-- Type: 21

if pe.get_regval(pe.REG_EAX) == 106 and pe.get_regval(pe.REG_EDX) == 80 then
  return mp.INFECTED
end
return mp.CLEAN
