-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:ContextualColisiLoader
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  if not peattributes.isdll then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 51200 or 102400 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_2 ~= "chrome.dll" then
    return mp.CLEAN
  end
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_3:sub(-26) ~= "\\google\\chrome\\application" then
    return mp.CLEAN
  end
  if l_0_3:find("\\program files", 1, true) == nil then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
