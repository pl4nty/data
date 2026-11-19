-- Threat: !InfrastructureShared
-- Name: ae7883aac242
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 110592 <= l_0_0 and l_0_0 <= 131072 and pehdr.NumberOfSections == 6 and (pesecs[1].VirtualSize > 4096 or pesecs[1].VirtualSize < 8192) then
  return mp.INFECTED
end
return mp.CLEAN
