-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Backdoor:WinNT/Rustock.F
-- Type: 8

if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SectionAlignment == 4096 then
  return mp.CLEAN
end
if pehdr.FileAlignment == 512 then
  return mp.CLEAN
end
if pehdr.FileAlignment == 4096 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].Characteristics ~= 1744830496 then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 65536 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED
