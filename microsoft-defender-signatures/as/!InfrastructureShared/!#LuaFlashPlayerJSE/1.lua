-- Threat: !InfrastructureShared
-- Name: !#Lua:FlashPlayerJSE
-- Type: 12

if string.len(mp.getfilename()) < 15 then
  return mp.CLEAN
end
local l_0_0 = string.lower(string.sub(mp.getfilename(), -15))
if l_0_0 == "flashplayer.jse" then
  return mp.INFECTED
end
return mp.CLEAN
