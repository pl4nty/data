-- Threat: !InfrastructureShared
-- Name: !#Lua:Cookstone
-- Type: 13
-- MpAttributes: Lua:PYExt | Lua:PYCExt

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Cookstone")
if 0 < #l_0_0 then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("mtprotostate", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\downloads\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\telegram desktop", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("greenlet", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("bot", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = mp.enum_mpattributesubstring("SCPT:CookstoneA")
  if 0 < #l_0_2 and (l_0_1:find("telegram", 1, true) or l_0_1:find("mitm_manager", 1, true) or l_0_1:find("\\telegram_testing\\", 1, true) or l_0_1:find("\\mitm_tools", 1, true) or l_0_1:find("\\wifibox", 1, true) or l_0_1:find("\\fake_ap", 1, true)) then
    mp.set_mpattribute("Lua:CookstoneA")
  end
  l_0_2 = mp.enum_mpattributesubstring("SCPT:CookstoneB")
  if 0 < #l_0_2 and (l_0_1:find("\\packages\\telegram\\", 1, true) or l_0_1:find("mitm_manager", 1, true) or l_0_1:find("\\core\\telegram_testing\\", 1, true)) then
    mp.set_mpattribute("Lua:CookstoneB")
  end
  return mp.INFECTED
end
return mp.CLEAN
