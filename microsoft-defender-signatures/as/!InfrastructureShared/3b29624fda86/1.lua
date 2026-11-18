-- Threat: !InfrastructureShared
-- Name: 3b29624fda86
-- Type: 21

mp.set_mpattribute("SCPT:Linux/SuspServiceCreation")
local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = ".service"
if string.find(l_0_0, l_0_1, -1 * l_0_1, true) then
  return mp.INFECTED
end
return mp.CLEAN
