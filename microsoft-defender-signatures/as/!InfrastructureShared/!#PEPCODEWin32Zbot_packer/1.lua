-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Win32/Zbot_packer
-- Type: 8

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if peattributes.epatscnstart ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 110592 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 106496 then
  return mp.CLEAN
end
if peattributes.x86_image ~= true then
  return mp.CLEAN
end
return mp.INFECTED
