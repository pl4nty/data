-- Threat: \xac!MSIDown.SA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:MSIExt

if mp.readu_u64(headerpage, 1) ~= -2226271756974174256 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if mp.GetMOTWZone() < 3 then
  return mp.CLEAN
end
local l_0_0 = mp.GetMOTWHostUrl()
if l_0_0 ~= nil and string.find(l_0_0, ".email", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
