-- Threat: !InfrastructureShared
-- Name: !#TEL:IOAVonFlashPlayer
-- Type: 13

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:FlashPlayerHTA") then
  return mp.INFECTED
end
if mp.get_mpattribute("Lua:FlashPlayerJSE") then
  return mp.INFECTED
end
return mp.CLEAN
