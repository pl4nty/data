-- Threat: !InfrastructureShared
-- Name: !#LUA:AutoItCustomDataSec
-- Type: 8

if mp.ispackedwith("AutoIt_+") and peattributes.epscn_writable and peattributes.lastscn_writable and pehdr.NumberOfSections == 4 and pesecs[3].SizeOfRawData > 262144 then
  local l_0_0 = pesecs[3].PointerToRawData + 20480
  mp.readprotection(false)
  local l_0_1 = mp.readfile(l_0_0, 16)
  if l_0_1 == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" then
    if mp.getfilesize() >= 4194304 then
      mp.set_mpattribute("AutoItIgnoreMaxSizes")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
