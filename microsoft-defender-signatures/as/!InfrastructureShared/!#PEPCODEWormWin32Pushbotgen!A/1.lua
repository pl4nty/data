-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Worm:Win32/Pushbot.gen!A
-- Type: 8

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].RVA == 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size == 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].RVA == 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].Size == 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 36864 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size <= 65536 then
  return mp.CLEAN
end
return mp.INFECTED
