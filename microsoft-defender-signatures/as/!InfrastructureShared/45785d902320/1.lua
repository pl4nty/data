-- Threat: !InfrastructureShared
-- Name: 45785d902320
-- Type: 21

local l_0_0 = mp.getfilesize()
if pehdr.NumberOfSections == 7 and 5844992 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
