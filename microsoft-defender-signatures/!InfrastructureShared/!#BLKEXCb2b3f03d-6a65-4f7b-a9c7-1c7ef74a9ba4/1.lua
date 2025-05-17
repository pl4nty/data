-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKEXCb2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4\1.luac 

-- params : ...
-- function num : 0
if (mp.IsHipsRuleEnabled)("b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") ~= true then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if (string.lower)((string.sub)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME), -4)) ~= ".msi" then
  return mp.CLEAN
end
if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) ~= "msiexec.exe" then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.IsTrustedFile)(false)
if l_0_0 == true then
  return mp.CLEAN
end
local l_0_2 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if (mp.IsPathExcludedForHipsRule)(l_0_3, "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") then
  return mp.CLEAN
end
if (MpCommon.QueryPersistContext)(l_0_3, l_0_2) then
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
else
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS)
  if (mp.bitand)(l_0_4, 264193) ~= 264193 then
    return mp.CLEAN
  end
  local l_0_5 = (MpCommon.ExpandEnvironmentVariables)("%systemdrive%")
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = (string.lower)(l_0_5)
  if (string.find)(l_0_3, "^" .. l_0_5) ~= nil then
    return mp.CLEAN
  end
end
do
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  if (MpCommon.GetPersistContextCount)(l_0_3) == 0 then
    local l_0_6 = {}
    ;
    (table.insert)(l_0_6, l_0_2)
    ;
    (MpCommon.SetPersistContext)(l_0_3, l_0_6, 0)
  else
    do
      if not (MpCommon.QueryPersistContext)(l_0_3, l_0_2) then
        (MpCommon.AppendPersistContext)(l_0_3, l_0_2, 0)
      end
      return mp.INFECTED
    end
  end
end

