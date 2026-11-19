-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Rorpian
-- Type: 8

if pehdr.NumberOfSections ~= 9 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 94208 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
return mp.INFECTED
