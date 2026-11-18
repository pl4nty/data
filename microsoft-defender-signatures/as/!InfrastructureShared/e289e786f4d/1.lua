-- Threat: !InfrastructureShared
-- Name: e289e786f4d
-- Type: 21

mp.set_mpattribute("SCPT:HackTool.Win32.POWERGAP.A1")
local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "link.ps1") ~= nil or string.find(l_0_0, "procvas.ps1") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
