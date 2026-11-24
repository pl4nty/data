-- Threat: !InfrastructureShared
-- Name: c07b3a9adfb65
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "767a35f6-ae33-4609-8630-c7d7a86ed134" then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.command_line
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) or l_0_3:find("/var/folders/[^/]+/[^/]+/T/TestCosign%w+/%d+/", 1, false) or l_0_1:find("^/private/tmp/%.sboxcache_%d+/vm_Trae_CN_Helper_%x+/", 1, false) or l_0_3:find("^/private/tmp/%.sboxcache_%d+/vm_Trae_CN_Helper_%x+/", 1, false) or l_0_3:find("/Library/Developer/CoreSimulator/Devices/", 1, true) and not l_0_3:find("/Library/Keychains/login.keychain", 1, true) then
  return mp.CLEAN
end
reportRelatedBmHits()
return mp.INFECTED
