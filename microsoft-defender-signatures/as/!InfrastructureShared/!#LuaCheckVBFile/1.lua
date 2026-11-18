-- Threat: !InfrastructureShared
-- Name: !#Lua:CheckVBFile
-- Type: 8

if not (pehdr.Machine == 332 and peattributes.isexe) or peattributes.resource_only_dll then
  return mp.CLEAN
end
if not (peattributes.isvbpcode or peattributes.isvbnative) or pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.SizeOfImage >= 131072 and pehdr.SizeOfImage <= 393216 and pesecs[1].SizeOfRawData >= 86016 and 393216 >= pesecs[1].SizeOfRawData then
  mp.set_mpattribute("Lua:TofseeVBFilter")
end
return mp.CLEAN
