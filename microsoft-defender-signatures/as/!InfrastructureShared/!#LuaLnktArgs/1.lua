-- Threat: !InfrastructureShared
-- Name: !#Lua:LnktArgs
-- Type: 13

if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1024 < l_0_0 then
  mp.set_mpattribute("LnkArggt400b")
elseif 512 < l_0_0 then
  mp.set_mpattribute("LnkArggt200b")
elseif 256 < l_0_0 then
  mp.set_mpattribute("LnkArggt100b")
elseif 128 < l_0_0 then
  mp.set_mpattribute("LnkArggt80b")
elseif 80 < l_0_0 then
  mp.set_mpattribute("LnkArggt50b")
end
return mp.CLEAN
