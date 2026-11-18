-- Threat: !InfrastructureShared
-- Name: 4178c2d666b1
-- Type: 21

local l_0_0 = mp.getfilesize()
if pehdr.NumberOfSections == 7 and peattributes.no_security == true and 348160 <= l_0_0 and l_0_0 <= 393216 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size == 56 then
  return mp.INFECTED
end
return mp.CLEAN
