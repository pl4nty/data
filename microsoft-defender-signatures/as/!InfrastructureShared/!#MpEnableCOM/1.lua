-- Threat: !InfrastructureShared
-- Name: !#MpEnableCOM
-- Type: 8

if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 131072 < l_0_0 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
return mp.INFECTED
