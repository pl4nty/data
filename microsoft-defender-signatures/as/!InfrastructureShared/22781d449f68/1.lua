-- Threat: !InfrastructureShared
-- Name: 22781d449f68
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
