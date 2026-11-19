-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4
-- Type: 11
-- MpAttributes: RPF:TopLevelFile

if mp.IsHipsRuleEnabled("b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") ~= true then
  return mp.CLEAN
end
if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not MpCommon.QueryPersistContext(l_0_1, l_0_0) then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS)
  if mp.bitand(l_0_2, 264193) ~= 264193 then
    return mp.CLEAN
  end
  local l_0_3 = MpCommon.ExpandEnvironmentVariables("%systemdrive%")
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_1, "^" .. l_0_3) ~= nil then
    return mp.CLEAN
  end
end
if mp.IsPathExcludedForHipsRule(l_0_1, "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") then
  return mp.CLEAN
end
if MpCommon.GetPersistContextCount(l_0_1) == 0 then
  local l_0_4 = {}
  table.insert(l_0_4, l_0_0)
  MpCommon.SetPersistContext(l_0_1, l_0_4, 0)
elseif not MpCommon.QueryPersistContext(l_0_1, l_0_0) then
  MpCommon.AppendPersistContext(l_0_1, l_0_0, 0)
end
mp.set_mpattribute("MpDisableCaching")
local l_0_5 = versioning.GetOsBuildNumber()
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  if peattributes.isdll then
    local l_0_6 = {
      ["rundll32.exe"] = true,
      ["regsvr32.exe"] = true
    }
    local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_7 and l_0_6[l_0_7:lower()] == true then
      local l_0_8, l_0_9 = mp.IsTrustedFile(false)
      if l_0_8 == false then
        mp.set_mpattribute("BM_BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4")
        return mp.INFECTED
      end
    end
  elseif peattributes.isexe and (mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) == true or l_0_5 < 10240) then
    local l_0_10, l_0_11 = mp.IsTrustedFile(false)
    if l_0_10 == false then
      mp.set_mpattribute("BM_BLKEXC:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
