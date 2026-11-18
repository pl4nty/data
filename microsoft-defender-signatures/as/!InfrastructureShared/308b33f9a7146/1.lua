-- Threat: !InfrastructureShared
-- Name: 308b33f9a7146
-- Type: 21

local l_0_0 = 3
if bm.GetSignatureMatchDuration() > l_0_0 * 10000000 then
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_2 = bm.get_imagepath()
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3
if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_3 = MpCommon.PathToWin32Path(this_sigattrlog[12].utf8p1)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_1(l_0_2)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_1(l_0_3)
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = MpCommon.GetPersistContextCount(l_0_2) or 0
if l_0_6 <= 0 or MpCommon.QueryPersistContext(l_0_2, "MpNewlyCreatedHintFileHasDigitalSignature_5m") ~= true then
  return mp.CLEAN
end
local l_0_7 = MpCommon.GetPersistContextCount(l_0_3) or 0
if l_0_7 <= 0 or MpCommon.QueryPersistContext(l_0_3, "MpNewlyCreatedHint_5m") ~= true then
  return mp.CLEAN
end
local l_0_8 = l_0_3:match("([^/\\]+)$")
if l_0_8 ~= nil and 4 <= #l_0_8 then
  local l_0_9 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\" .. l_0_8)
  local l_0_10 = MpCommon.ExpandEnvironmentVariables("%windir%\\syswow64\\" .. l_0_8)
  local l_0_11 = bm.get_current_process_startup_info()
  if l_0_11 == nil or l_0_11.ppid == nil then
    return mp.CLEAN
  end
  if l_0_9 ~= nil and sysio.IsFileExists(l_0_9) or l_0_10 ~= nil and sysio.IsFileExists(l_0_10) then
    MpCommon.BmTriggerSig(l_0_11.ppid, "PossibleDllHijackExecFlowD", l_0_3)
  else
    MpCommon.BmTriggerSig(l_0_11.ppid, "PossibleDllHijackExecFlowC", l_0_3)
    bm.add_related_file(l_0_3)
    mp.ReportLowfi(l_0_3, 2548727693)
    return mp.INFECTED
  end
end
return mp.CLEAN
