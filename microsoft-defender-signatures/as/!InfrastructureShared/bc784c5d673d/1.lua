-- Threat: !InfrastructureShared
-- Name: bc784c5d673d
-- Type: 21

if peattributes.is_process and not peattributes.hstr_exhaustive then
  return mp.INFECTED
end
return mp.CLEAN
