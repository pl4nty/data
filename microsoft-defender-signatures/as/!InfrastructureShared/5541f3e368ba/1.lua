-- Threat: !InfrastructureShared
-- Name: 5541f3e368ba
-- Type: 21
-- Flags: 1

if pe.get_versioninfo().ProductName == "ePass2001" then
  return mp.CLEAN
end
return mp.INFECTED
