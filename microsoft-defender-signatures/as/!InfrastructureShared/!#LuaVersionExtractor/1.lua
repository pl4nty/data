-- Threat: !InfrastructureShared
-- Name: !#Lua:VersionExtractor
-- Type: 10
-- Includes: LuaFuncHelper
-- MpAttributes: HSTR_VersionExtractor

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = mp.getfilename()
  local l_0_1 = MpCommon.GetPersistContext(l_0_0)
  local l_0_2, l_0_3, l_0_4
  if l_0_1 ~= nil then
    for l_0_5, l_0_6 in ipairs(l_0_1) do
      local l_0_7 = string.match(l_0_6, "^AppName:([%w%.]+)$")
      if l_0_7 ~= nil then
        l_0_2 = l_0_7
      end
      l_0_7 = string.match(l_0_6, "^AppVersion:([%w%.]+)$")
      if l_0_7 ~= nil then
        l_0_3 = l_0_7
      end
      l_0_7 = string.match(l_0_6, "^AppVersionStr:([%w%.]+)$")
      if l_0_7 ~= nil then
        l_0_4 = l_0_7
      end
    end
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_8 = "app_version_" .. l_0_2
  local l_0_9 = 31536000
  local l_0_10 = 50
  if l_0_3 ~= nil then
    AppendToRollingQueue(l_0_8, l_0_0, l_0_3, l_0_9, l_0_10)
  elseif l_0_4 ~= nil then
    AppendToRollingQueue(l_0_8, l_0_0, l_0_4, l_0_9, l_0_10)
  end
end
return mp.INFECTED
