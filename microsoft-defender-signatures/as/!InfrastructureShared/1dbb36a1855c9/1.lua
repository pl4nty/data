-- Threat: !InfrastructureShared
-- Name: 1dbb36a1855c9
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if not l_0_0 then
    return mp.CLEAN
  end
end
local l_0_1, l_0_2 = UrlGrader(l_0_0.Url, "PFATamper.E", false)
if l_0_1 == 0 then
  return mp.CLEAN
end
l_0_0.Url = l_0_2
local l_0_3, l_0_4
if not l_0_0.AttributeValue then
  return mp.CLEAN
end
local l_0_5 = l_0_0.AttributeValue
local l_0_6 = safeJsonDeserialize(l_0_5)
if l_0_6 then
  l_0_3 = l_0_6.AppName
  l_0_4 = l_0_6.Pid
else
  l_0_3 = l_0_5:match("[^|]+")
  l_0_4 = l_0_5:match("|(pid[^|]+)")
end
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_7 = {}
l_0_7.isThreat = false
if this_sigattrlog[2].matched then
  l_0_7.type = "BM_SIGTRIGGER"
  l_0_7.event = this_sigattrlog[2].utf8p1
  l_0_7.isThreat = this_sigattrlog[2].utf8p2 == "THREAT" and true
  l_0_7.processName = this_sigattrlog[2].image_path
elseif this_sigattrlog[3].matched then
  l_0_7.type = "BM_SIGTRIGGER"
  l_0_7.event = this_sigattrlog[3].utf8p1
  l_0_7.isThreat = this_sigattrlog[3].utf8p2 == "THREAT" and true
  l_0_7.processName = this_sigattrlog[3].image_path
elseif this_sigattrlog[4].matched then
  l_0_7.type = "BM_SIGTRIGGER"
  l_0_7.event = this_sigattrlog[4].utf8p1
  l_0_7.isThreat = this_sigattrlog[4].utf8p2 == "THREAT" and true
  l_0_7.processName = this_sigattrlog[4].image_path
elseif this_sigattrlog[5].matched then
  l_0_7.type = "BM_TP_IGNORE"
  l_0_7.block_usermode = this_sigattrlog[5].reg_block_usermode
  l_0_7.event = this_sigattrlog[5].utf8p1
  l_0_7.isThreat = false
  l_0_7.processName = this_sigattrlog[5].image_path
elseif this_sigattrlog[6].matched then
  l_0_7.type = "BM_TP_IGNORE"
  l_0_7.block_usermode = this_sigattrlog[6].reg_block_usermode
  l_0_7.event = this_sigattrlog[6].utf8p1
  l_0_7.isThreat = false
  l_0_7.processName = this_sigattrlog[6].image_path
elseif this_sigattrlog[7].matched then
  l_0_7.type = "BM_TP_BLOCK"
  l_0_7.block_usermode = this_sigattrlog[7].reg_block_usermode
  l_0_7.event = this_sigattrlog[7].utf8p1
  l_0_7.isThreat = true
  l_0_7.processName = this_sigattrlog[7].image_path
elseif this_sigattrlog[8].matched then
  l_0_7.type = "BM_TP_BLOCK"
  l_0_7.block_usermode = this_sigattrlog[8].reg_block_usermode
  l_0_7.event = this_sigattrlog[8].utf8p1
  l_0_7.isThreat = true
  l_0_7.processName = this_sigattrlog[8].image_path
elseif this_sigattrlog[9].matched then
  l_0_7.type = "CMD_DETECTION"
  l_0_7.event = this_sigattrlog[9].utf8p2
  l_0_7.isThreat = this_sigattrlog[9].utf8p1 == "BM_BLOCKPROCESSCREATE" and true
  l_0_7.processName = this_sigattrlog[9].image_path
elseif this_sigattrlog[10].matched then
  l_0_7.type = "AMSI_DETECTION"
  l_0_7.event = this_sigattrlog[10].utf8p1
  l_0_7.isThreat = this_sigattrlog[10].utf8p2 == "INFECTED" and true
  l_0_7.processName = this_sigattrlog[10].image_path
end
add_parents()
local l_0_13 = bm.get_current_process_startup_info()
local l_0_14 = reportRelevantUntrustedEntitiesForPid(l_0_13.ppid)
bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_14), bm.RelatedStringBMReport)
l_0_0.TamperingEvent = l_0_7
bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
local l_0_15
if l_0_0.AttributeName == "PFApp_Parent" then
  l_0_15 = "PFServers"
else
  l_0_15 = "programfiles_Net"
end
local l_0_16, l_0_17 = startTrackingApp(l_0_4, l_0_3, l_0_15, l_0_0.AttributeName)
if not l_0_16 then
  l_0_17.SignatureName = "PFATamper.E"
  bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_17))
else
  local l_0_18 = l_0_7.isThreat and 30 or 10
  local l_0_19 = "Tampering[" .. l_0_13.ppid:match("pid:(%d+)") .. "][" .. l_0_7.event .. "]"
  IncreaseProcessAnomalyScore(l_0_13.ppid, l_0_18, l_0_19, l_0_0.AttributeName)
end
return mp.INFECTED
