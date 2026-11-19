-- Threat: !InfrastructureShared
-- Name: 5f7882f06991
-- Type: 21

if pehdr.NumberOfSections == 9 and mp.get_mpattribute("TELPER:QQBrowser") then
  return mp.INFECTED
end
return mp.CLEAN
