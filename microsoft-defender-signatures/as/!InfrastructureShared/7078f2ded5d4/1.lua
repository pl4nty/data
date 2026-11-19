-- Threat: !InfrastructureShared
-- Name: 7078f2ded5d4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 131072 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size == 56 then
  return mp.INFECTED
end
return mp.CLEAN
