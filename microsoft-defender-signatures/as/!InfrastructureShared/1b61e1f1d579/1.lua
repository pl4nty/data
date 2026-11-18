-- Threat: !InfrastructureShared
-- Name: 1b61e1f1d579
-- Type: 21

local l_0_0 = mp.getfilesize()
if 614400 <= l_0_0 and l_0_0 <= 720896 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size == 56 and pehdr.Subsystem == 2 and pehdr.NumberOfSections >= 7 and pehdr.NumberOfSections <= 10 then
  return mp.INFECTED
end
return mp.CLEAN
