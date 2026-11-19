-- Threat: !InfrastructureShared
-- Name: 12578fa6dab28
-- Type: 21

if mp.HSTR_WEIGHT >= 6 and pesecs[1].SizeOfRawData > 1310720 and pesecs[pehdr.NumberOfSections].SizeOfRawData > 4194304 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
