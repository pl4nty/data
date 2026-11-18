-- Threat: !InfrastructureShared
-- Name: 6178a470d6a0
-- Type: 21

if (peattributes.isdll or peattributes.isexe or peattributes.ismsil) and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
