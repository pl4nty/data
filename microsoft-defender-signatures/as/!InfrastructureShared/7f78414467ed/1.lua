-- Threat: !InfrastructureShared
-- Name: 7f78414467ed
-- Type: 21

local l_0_0 = mp.getfilesize()
if 20480 <= l_0_0 and l_0_0 <= 24576 and (mp.get_mpattribute("NID:Trickbot.GB!Pra1") or mp.get_mpattribute("NID:Trickbot.GB!Pra2")) then
  return mp.INFECTED
end
return mp.CLEAN
