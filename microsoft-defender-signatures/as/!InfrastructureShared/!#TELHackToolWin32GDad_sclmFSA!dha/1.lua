-- Threat: !InfrastructureShared
-- Name: !#TEL:HackTool:Win32/GDad_sclmFS.A!dha
-- Type: 13

if mp.GetResmgrBasePlugin() ~= "File" then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.len ~= 8 then
  return mp.CLEAN
end
if string.find(l_0_0, "sclm.dll", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
