-- Threat: !InfrastructureShared
-- Name: 1ad7844c48adb
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections == 4 and pehdr.SizeOfImage >= 3342336 and pehdr.SizeOfImage <= 3538944 and pesecs[pehdr.NumberOfSections].Name == ".rsrc" and pesecs[pehdr.NumberOfSections].SizeOfRawData == 32768 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
