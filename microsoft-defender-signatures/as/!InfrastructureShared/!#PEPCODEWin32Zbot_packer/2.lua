-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Win32/Zbot_packer
-- Type: 8

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 102400 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 98304 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size <= 512 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size >= 2048 then
  return mp.CLEAN
end
if peattributes.x86_image ~= true then
  return mp.CLEAN
end
return mp.INFECTED
