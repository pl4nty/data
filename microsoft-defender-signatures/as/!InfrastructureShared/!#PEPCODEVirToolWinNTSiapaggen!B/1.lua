-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:VirTool:WinNT/Siapag.gen!B
-- Type: 8

if peattributes.isdriver ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pehdr.SizeOfCode > 1792 then
  return mp.CLEAN
end
if 1792 < pehdr.SizeOfHeaders then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 28672 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.Characteristics ~= 270 then
  return mp.CLEAN
end
if 5 > pehdr.MajorLinkerVersion then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion > 7 then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion == 6 then
  return mp.CLEAN
end
if pehdr.MajorSubsystemVersion ~= 5 then
  return mp.CLEAN
end
if pehdr.DllCharacteristics ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
