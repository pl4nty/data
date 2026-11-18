-- Threat: !InfrastructureShared
-- Name: 5229cb64366e
-- Type: 21

if mp.get_mpattribute("SCPT:HTML/SuspiciousRedirect") then
  return mp.INFECTED
end
return mp.CLEAN
