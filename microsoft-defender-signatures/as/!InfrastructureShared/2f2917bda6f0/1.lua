-- Threat: !InfrastructureShared
-- Name: 2f2917bda6f0
-- Type: 21

mp.set_mpattribute("SCPT:Linux/SuspCronEntry")
local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = "/etc/crontab"
if string.find(l_0_0, l_0_1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
