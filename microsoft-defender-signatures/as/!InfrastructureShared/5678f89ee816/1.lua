-- Threat: !InfrastructureShared
-- Name: 5678f89ee816
-- Type: 21

if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if not peattributes.x86_image then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData < 483328 or pesecs[1].SizeOfRawData > 495616 then
  return mp.CLEAN
end
if pesecs[2].SizeOfRawData > 8192 then
  return mp.CLEAN
end
if pesecs[3].SizeOfRawData ~= 12288 then
  return mp.CLEAN
end
if pesecs[4].SizeOfRawData ~= 4096 then
  return mp.CLEAN
end
if pesecs[5].SizeOfRawData < 1146880 or pesecs[5].SizeOfRawData > 1196032 then
  return mp.CLEAN
end
return mp.INFECTED
