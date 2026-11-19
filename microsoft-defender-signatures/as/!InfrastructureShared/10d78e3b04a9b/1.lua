-- Threat: !InfrastructureShared
-- Name: 10d78e3b04a9b
-- Type: 21

local l_0_0 = mp.getfilesize()
if 172032 <= l_0_0 and l_0_0 <= 176128 and pehdr.NumberOfSections >= 4 and pehdr.NumberOfSections <= 6 and mp.get_mpattribute("NID:GandCrab.A!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
