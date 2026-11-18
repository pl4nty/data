-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Backdoor:Win32/Afcore.gen!D
-- Type: 8

if pehdr.DataDirectory[2].RVA ~= 8256 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size >= 80 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 16384 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size <= 98304 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].RVA ~= 8192 then
  return mp.CLEAN
end
if 80 <= pehdr.DataDirectory[13].Size then
  return mp.CLEAN
end
return mp.INFECTED
