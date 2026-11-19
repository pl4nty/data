-- Threat: !InfrastructureShared
-- Name: !#Trojan:Win32/Unusual!FutureTimeDateStamp
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if peattributes.isexe == false then
  return mp.CLEAN
end
if peattributes.isdriver == true then
  return mp.CLEAN
end
if peattributes.no_security == false then
  return mp.CLEAN
end
if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.epinfirstsect == true then
  return mp.CLEAN
end
if peattributes.suspicious_timestamp == false then
  return mp.CLEAN
end
if peattributes.no_debug == false then
  return mp.CLEAN
end
if pehdr.TimeDateStamp == 0 or pehdr.TimeDateStamp == -1 then
  return mp.CLEAN
end
if not string.find(string.lower(mp.getfilename()), ".exe$") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetCurrentTimeT()
if l_0_1 == nil or l_0_1 == 0 or l_0_1 == -1 then
  return mp.CLEAN
end
if pehdr.TimeDateStamp > l_0_1 + 2621440 then
  return mp.LOWFI
end
return mp.CLEAN
