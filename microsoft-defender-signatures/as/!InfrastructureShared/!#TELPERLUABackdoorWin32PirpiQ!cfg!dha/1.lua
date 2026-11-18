-- Threat: !InfrastructureShared
-- Name: !#TELPER:LUA:Backdoor:Win32/Pirpi.Q!cfg!dha
-- Type: 10

if peattributes.no_security == false then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 and 30000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
local l_0_2 = string.sub(l_0_1, -4)
if l_0_2 == ".exe" then
  return mp.CLEAN
end
if peattributes.isdll ~= false then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.Characteristics ~= 258 then
  return mp.CLEAN
end
local l_0_3 = pe.get_versioninfo()
if l_0_3.InternalName ~= "ping.exe" then
  return mp.CLEAN
end
mp.readprotection(false)
if mp.readu_u32(2048, 1) == 0 or mp.readu_u32(2052, 1) == 0 or mp.readu_u32(2056, 1) == 0 or mp.readu_u32(2060, 1) == 0 or mp.readu_u32(2064, 1) == 0 then
  return mp.CLEAN
end
local l_0_4 = mp.readfile(2048, 512)
if string.find(l_0_4, "\204\204\204\204\204", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_4, "hN'\000\000", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_4, "h\017'\000\000j\001", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_4, "hB'\000\000j\001\232", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
