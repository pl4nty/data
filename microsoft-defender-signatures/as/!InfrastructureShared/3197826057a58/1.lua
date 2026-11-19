-- Threat: !InfrastructureShared
-- Name: 3197826057a58
-- Type: 21

local l_0_1 = peattributes.isexe and peattributes.epinfirstsect and pehdr.NumberOfSections > 7 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size > 4718592 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size < 6291456 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_IMPORT].Size > 2048 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_BASERELOC].Size > 4096
if l_0_1 == false then
  mp.changedetectionname(268436426)
  return mp.INFECTED
end
return mp.INFECTED
