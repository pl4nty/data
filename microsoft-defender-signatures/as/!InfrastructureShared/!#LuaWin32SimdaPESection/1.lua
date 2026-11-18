-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/SimdaPESection
-- Type: 8

if pehdr.NumberOfSections >= 10 and pesecs[6].Name == ".driver" and pesecs[7].NameDW == 1734763310 and (pesecs[8].NameDW == 1667331374 or pesecs[10].NameDW == 1667331374) then
  return mp.INFECTED
end
return mp.CLEAN
