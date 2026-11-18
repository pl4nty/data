-- Threat: !InfrastructureShared
-- Name: 4d29b9df3a3a
-- Type: 21
-- Includes: LuaFuncHelper

if mp.get_mpattribute("OfficeTemplateRepChecked") or mp.get_mpattribute("Detection:TrojanDownloader:O97M/BadTemplate.D") or not mp.get_mpattribute("//AGGR:OfficeFileOLE_1") then
  return mp.CLEAN
end
mp.set_mpattribute("//SCPT:OleExternalRelationship.Template")
local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = mp.GetNormalizedScript(l_0_0.is_header)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
for l_0_3 in string.gmatch(l_0_1, "Target=\"([Hh][Tt][Tt][Pp][Ss]?:[^\"]-)\"") do
  if l_0_2[l_0_3] == nil then
    table.insert(l_0_2, l_0_3)
  end
end
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4.SIG_CONTEXT = "Office External Template"
l_0_4.CONTENT_SOURCE = "Office External Template"
l_0_4.PROCESS_CONTEXT = "Office"
l_0_4.PARENT_CONTEXT = nil
l_0_4.FILELESS = "false"
l_0_4.CMDLINE_URL = "false"
l_0_4.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_4.BREAK_AT_FIRST_HIT_PHISH = "60"
if mp.get_mpattribute("InEmail") then
  l_0_4.TAG = "Email"
end
local l_0_5 = CheckUrlReputationSimple(l_0_2, l_0_4, 60)
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
