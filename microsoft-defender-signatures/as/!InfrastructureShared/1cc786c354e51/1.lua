-- Threat: !InfrastructureShared
-- Name: 1cc786c354e51
-- Type: 21

if mp.get_mpattribute("SIGATTR:Win32/AVKRRM") then
  return mp.CLEAN
end
return mp.INFECTED
