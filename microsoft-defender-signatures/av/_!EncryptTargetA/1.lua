-- Threat: \xac!EncryptTarget.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0, "(%.[^%.\\]+)%.([^%.\\]+)$")
if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = {
  [".doc"] = true,
  [".docx"] = true,
  [".xls"] = true,
  [".xlsx"] = true,
  [".pdf"] = true,
  [".csv"] = true,
  [".txt"] = true
}
if l_0_3[l_0_1] ~= true then
  return mp.CLEAN
end
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_4 == nil or string.lower(l_0_4) ~= "rw-sim.exe" then
  return mp.CLEAN
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = mp.GetProcessCommandLine(l_0_5)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
local l_0_7, l_0_8 = string.match(l_0_6, "mode%s+([^%s]+).+extension%s+([^%s]+)$")
if l_0_7 ~= "encrypt" then
  return mp.CLEAN
end
if l_0_8 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_9 = versioning.GetOrgID()
if l_0_9 == nil or type(l_0_9) ~= "string" then
  return mp.CLEAN
end
l_0_9 = string.lower(l_0_9)
if l_0_9 ~= "399860c4-b0ea-40c1-a834-7463bf290b5d" and (l_0_9 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or versioning.IsSampled(100, false, true, true) ~= true) and versioning.IsSampled(1, false, false, false) ~= true then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableMOACSyncInsert")
mp.set_mpattribute("MpDisableCaching")
MpCommon.BmTriggerSig(l_0_5, "BAS_EncryptTargetE", l_0_0)
return mp.INFECTED
