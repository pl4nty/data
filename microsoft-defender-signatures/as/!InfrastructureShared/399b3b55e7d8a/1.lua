-- Threat: !InfrastructureShared
-- Name: 399b3b55e7d8a
-- Type: 21
-- Includes: AppomalyHelpers, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.isThreat = false
if this_sigattrlog[4].matched then
  l_0_3.alert = this_sigattrlog[4].utf8p1
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[5].matched then
  l_0_3.alert = this_sigattrlog[5].utf8p1
  l_0_3.type = "SIGTRIGGER"
  l_0_3.isThreat = true
elseif this_sigattrlog[6].matched then
  l_0_3.alert = this_sigattrlog[6].utf8p2
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[7].matched then
  l_0_3.alert = this_sigattrlog[7].utf8p2
  l_0_3.isThreat = true
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[8].matched then
  l_0_3.alert = this_sigattrlog[8].utf8p2
  l_0_3.isThreat = true
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[9].matched then
  l_0_3.alert = this_sigattrlog[9].utf8p1
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[10].matched then
  l_0_3.alert = this_sigattrlog[10].utf8p1
  l_0_3.isThreat = true
  l_0_3.type = "SIGTRIGGER"
elseif this_sigattrlog[11].matched then
  l_0_3.alert = this_sigattrlog[11].utf8p1
  l_0_3.type = "Exclusion"
elseif this_sigattrlog[12].matched then
  l_0_3.alert = this_sigattrlog[12].utf8p1
  l_0_3.type = "Exclusion"
elseif this_sigattrlog[13].matched then
  l_0_3.alert = this_sigattrlog[13].utf8p1
  l_0_3.type = "Tampering"
elseif this_sigattrlog[14].matched then
  l_0_3.alert = this_sigattrlog[14].utf8p1
  l_0_3.type = "Tampering"
elseif this_sigattrlog[15].matched then
  l_0_3.alert = this_sigattrlog[15].utf8p1
  l_0_3.type = "Tampering"
  l_0_3.isThreat = true
elseif this_sigattrlog[16].matched then
  l_0_3.alert = this_sigattrlog[16].utf8p1
  l_0_3.type = "Tampering"
  l_0_3.isThreat = true
end
if not l_0_3.alert then
  return mp.CLEAN
end
l_0_3.score = AlertGrading(l_0_3, l_0_0.ppid)
local l_0_4 = "[" .. l_0_3.type .. "][" .. l_0_0.ppid:match("pid:(%d+)") .. "][" .. l_0_3.alert .. "]"
local l_0_5, l_0_6 = IncreaseProcessAnomalyScore(l_0_0.ppid, l_0_3.score, l_0_4, l_0_1, {
  isThreat = l_0_3.isThreat
})
if not l_0_5 then
  local l_0_7 = {}
  l_0_7.SignatureName = "BM/PFATamper.D"
  l_0_7.ProcessName = bm.get_imagepath()
  l_0_7.err = l_0_6
  l_0_7.AttributeValue = l_0_2
  local l_0_8 = safeJsonSerialize(l_0_7)
  bm.trigger_sig("ProcAttribError", l_0_8)
  bm.add_related_string("Error", l_0_8, bm.RelatedStringBMReport)
else
  l_0_2 = l_0_6
end
l_0_3.ProcessAttribute = l_0_2
bm.add_related_string("Event", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
return mp.INFECTED
