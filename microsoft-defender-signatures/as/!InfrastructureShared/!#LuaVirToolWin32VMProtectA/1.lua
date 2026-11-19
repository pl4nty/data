-- Threat: !InfrastructureShared
-- Name: !#Lua:VirTool:Win32/VMProtect.A
-- Type: 8

if pevars.epsec < 4 or pevars.epsec > pehdr.NumberOfSections or pesecs[pevars.epsec].NameDW ~= pesecs[pevars.epsec - 1].NameDW or pesecs[pevars.epsec - 1].SizeOfRawData ~= 0 or pesecs[pevars.epsec - 1].PointerToRawData ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
