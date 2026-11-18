-- Threat: !InfrastructureShared
-- Name: 2989444e5026
-- Type: 21

if pe.get_regval(pe.REG_ESP) == 1245124 then
  return mp.INFECTED
end
return mp.CLEAN
