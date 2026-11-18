-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/VMProtect
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 1886221870 then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
return mp.INFECTED
