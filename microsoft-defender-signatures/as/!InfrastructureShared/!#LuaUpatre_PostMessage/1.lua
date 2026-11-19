-- Threat: !InfrastructureShared
-- Name: !#Lua:Upatre_PostMessage
-- Type: 10

if peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 17920 or 70656 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("SIGATTR:PostMessage!Unusual") or mp.get_mpattribute("SIGATTR:SendMessage!Unusual") then
  return mp.INFECTED
end
return mp.CLEAN
