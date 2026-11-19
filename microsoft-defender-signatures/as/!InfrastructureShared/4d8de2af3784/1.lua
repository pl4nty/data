-- Threat: !InfrastructureShared
-- Name: 4d8de2af3784
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.GetCertificateInfo()
if 0 < #l_0_1 and l_0_1 ~= nil then
  return mp.CLEAN
end
local l_0_2 = hstrlog[2].hitcount
if l_0_2 < 3 then
  return mp.CLEAN
end
local l_0_3 = hstrlog[1].location
local l_0_4 = hstrlog[5].location
if l_0_4 == nil or l_0_4 == 0 or l_0_3 == nil or l_0_3 == 0 or machoLC == nil or machoLC.__TEXT == nil or machoLC.__TEXT.__const == nil or machoLC.__TEXT.__const == "" then
  return mp.CLEAN
end
local l_0_5 = machoLC.__TEXT.__const.Size
local l_0_6 = machoLC.__TEXT.__const.Offset
if l_0_5 == nil or l_0_6 == nil or l_0_5 == 0 or l_0_6 == 0 then
  return mp.CLEAN
end
if l_0_3 >= l_0_6 and l_0_3 <= l_0_6 + l_0_5 and l_0_4 >= l_0_6 and l_0_4 <= l_0_6 + l_0_5 then
  local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_7 then
    MpCommon.BmTriggerSig(l_0_7, "BM_SuspRevShellEmbedded", l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
