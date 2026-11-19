-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Gatak.EA!dha
-- Type: 10

if peattributes.no_security == false then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 990000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_3 == "googletalk.exe" and string.sub(l_0_2, -28, -1) == "\\appdata\\roaming\\google talk" then
  return mp.INFECTED
end
if l_0_3 == "skype.exe" and string.sub(l_0_2, -28, -1) == "\\appdata\\roaming\\skype\\phone" then
  return mp.INFECTED
end
if l_0_3 == "advantage.exe" and string.sub(l_0_2, -26, -1) == "\\appdata\\roaming\\advantage" then
  return mp.INFECTED
end
return mp.CLEAN
