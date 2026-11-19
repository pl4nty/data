-- Threat: !InfrastructureShared
-- Name: 2661ac5380a5
-- Type: 21

if mp.IsTrustedFile(false) == true or mp.IsKnownFriendlyFile(mp.getfilename(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
