-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Mancsyn.gen!A.2
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if mp.getfilesize() ~= 72706 then
  return mp.CLEAN
end
return mp.INFECTED
