-- Threat: !InfrastructureShared
-- Name: 654035ca078f
-- Type: 21

if mp.get_mpattribute("MpHasValidProjPath") then
  return mp.INFECTED
end
return mp.CLEAN
