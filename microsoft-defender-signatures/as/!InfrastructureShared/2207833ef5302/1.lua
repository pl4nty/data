-- Threat: !InfrastructureShared
-- Name: 2207833ef5302
-- Type: 21

if mp.get_mpattribute("Win32/AutoIt_HSTR2") then
  return mp.INFECTED
end
return mp.CLEAN
