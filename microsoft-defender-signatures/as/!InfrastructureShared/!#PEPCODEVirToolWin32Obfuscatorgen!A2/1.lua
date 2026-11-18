-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:Win32/Obfuscator.gen!A.2
-- Type: 8

if epcode[1] ~= 100 then
  return mp.CLEAN
end
if epcode[2] ~= 161 then
  return mp.CLEAN
end
if epcode[3] ~= 48 then
  return mp.CLEAN
end
if epcode[4] ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
