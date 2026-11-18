-- Threat: !InfrastructureShared
-- Name: 7178481cc6c9
-- Type: 21

if pehdr.NumberOfSections >= 2 and peattributes.isexe and peattributes.lastscn_writable and peattributes.lastscn_executable and peattributes.lastscn_vfalign and pesecs[pehdr.NumberOfSections].Name == ".text" and hstrlog[1].VA - pehdr.ImageBase >= pesecs[pehdr.NumberOfSections].VirtualAddress then
  return mp.INFECTED
end
return mp.CLEAN
