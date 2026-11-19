-- Threat: !InfrastructureShared
-- Name: !#Lua:LowIntegrityCheckInUACPath.B
-- Type: 10

local l_0_0 = mp.GetUACMetadata()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.Info.ApplicationName)
  if string.find(l_0_1, "\\appdata\\", 1, true) and (string.find(l_0_1, "cache\\low\\", 1, true) or string.find(l_0_1, "\\locallow\\", 1, true) or string.find(l_0_1, "\\temp\\low\\", 1, true) or string.find(l_0_1, "\\privacie\\low\\", 1, true) or string.find(l_0_1, "\\inetcookies\\low\\", 1, true) or string.find(l_0_1, "\\inetcache\\virtualize\\", 1, true) or string.find(l_0_1, "\\microsoft\\playready\\", 1, true) or string.find(l_0_1, "\\dntexception\\low\\", 1, true) or string.find(l_0_1, "\\history\\low\\", 1, true)) then
    return mp.SYNCLOWFI
  end
end
return mp.CLEAN
