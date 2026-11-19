-- Threat: !InfrastructureShared
-- Name: 16a61049d863d
-- Type: 21

local l_0_0 = mp.getfilesize()
if hstrlog[1].matched and peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 159744 and (pehdr.NumberOfSections == 9 or pehdr.NumberOfSections == 6) then
  return mp.INFECTED
end
return mp.CLEAN
