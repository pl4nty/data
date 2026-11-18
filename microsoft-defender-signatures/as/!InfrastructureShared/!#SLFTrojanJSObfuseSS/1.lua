-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/Obfuse.SS
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:HasMotw

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if mp.GetMOTWZone() < 3 then
  return mp.CLEAN
end
local l_0_0 = mp.GetMOTWHostUrl()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, ".sbs/lander/", 1, true) and string.find(l_0_0, "download.php", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
