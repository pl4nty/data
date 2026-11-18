-- Threat: !InfrastructureShared
-- Name: 5bb331620c50
-- Type: 21

if mp.ENGINEBUILD < 24070 then
  return mp.CLEAN
end
local l_0_0 = bm.GetMemQueryCount()
if l_0_0 ~= nil and 0 < l_0_0 then
  local l_0_1 = "SMS_ExitEvent_Counter"
  local l_0_2 = MpCommon.AtomicCounterValue(l_0_1)
  if not l_0_2 then
    MpCommon.AtomicCounterSet(l_0_1, 1, 3600)
    l_0_2 = 1
  else
    MpCommon.AtomicCounterAdd(l_0_1, 1)
  end
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].ppid ~= nil then
    local l_0_3 = this_sigattrlog[1].utf8p2
    local l_0_4 = this_sigattrlog[1].ppid
    local l_0_5 = l_0_3:match("sigseq=([^;]+);")
    if l_0_5 == nil or l_0_5 == "" then
      return mp.CLEAN
    end
    local l_0_6 = l_0_3:match("scancnt=(%d)")
    if l_0_6 == nil or l_0_6 == "" or l_0_6 == "0" then
      return mp.CLEAN
    end
    local l_0_7 = l_0_3:match("reason=([^;]+);")
    if l_0_7 == nil or l_0_7 == "" then
      return mp.CLEAN
    end
    local l_0_8 = 0
    if l_0_5 == "0x0" then
      l_0_8 = 5
    elseif l_0_7 == "exitproc" then
      l_0_8 = 6
    elseif l_0_7 == "max_scan" then
      l_0_8 = 7
    elseif 1 < l_0_0 then
      l_0_8 = 8
    else
      l_0_8 = l_0_2 % 5
    end
    local l_0_9 = string.format("memQueryCount:%s;grp:%s;sigseq:%s;reason:%s", tostring(l_0_0), tostring(l_0_8), l_0_5, l_0_7)
    bm.trigger_sig("SMSHasValidMemoryQueryData", l_0_9, l_0_4)
  end
end
return mp.CLEAN
