-- Threat: !InfrastructureShared
-- Name: 3e298f11bd30
-- Type: 21

if string.find(mp.getfilename():lower(), "appdata\\roaming\\%l+\\[^\\]+$") then
  return mp.INFECTED
end
return mp.CLEAN
