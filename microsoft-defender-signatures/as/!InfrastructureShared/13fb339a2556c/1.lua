-- Threat: !InfrastructureShared
-- Name: 13fb339a2556c
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if not string.find(l_0_0, "c:\\programdata\\", 1, true) and not string.find(l_0_0, "\\appdata\\roaming\\", 1, true) and not string.find(l_0_0, "\\appdata\\local\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "autohotkey", 1, true) or string.find(l_0_0, "ahk", 1, true) or string.find(l_0_0, "keys", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
