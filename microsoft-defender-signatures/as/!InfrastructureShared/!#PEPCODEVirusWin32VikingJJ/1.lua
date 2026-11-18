-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Virus:Win32/Viking.JJ
-- Type: 8

if peattributes.epatscnstart ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData <= 512 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData >= 768 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size <= 0 then
  return mp.CLEAN
end
return mp.INFECTED
