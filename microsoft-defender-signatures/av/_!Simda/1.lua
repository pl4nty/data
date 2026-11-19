-- Threat: \x84!Simda
-- Type: 9
-- MpAttributes: LUA:HasStolenDigitalSignature

if not peattributes.isexe then
  return mp.CLEAN
end
if peattributes.packersigmatched then
  return mp.CLEAN
end
if peattributes.isdriver then
  return mp.CLEAN
end
if peattributes.isvbpcode then
  return mp.CLEAN
end
if peattributes.isvbnative then
  return mp.CLEAN
end
if peattributes.ismsil then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 8 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 300000 < l_0_0 or l_0_0 < 100000 then
  return mp.CLEAN
end
if mp.get_mpattribute("RPF:PWS:Win32/Simda.gen!B") then
  return mp.INFECTED
end
return mp.CLEAN
