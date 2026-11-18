-- Threat: !InfrastructureShared
-- Name: !#LUA:Drixed.A!dll
-- Type: 10

if not mp.get_mpattribute("ALF:FOP:Backdoor:Win64/Drixed.Q!dha") then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 400000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 8 then
  return mp.CLEAN
end
if pesecs[1].VirtualSize > 4096 then
  return mp.CLEAN
end
mp.set_mpattribute("LUA:Drixed.A!dll")
return mp.CLEAN
