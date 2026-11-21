-- Threat: !InfrastructureShared
-- Name: !#TEL:Win32/SysvolPolicyNewSmbWriter.A
-- Type: 12
-- Includes: SysvolPathInfra
-- MpAttributes: RPF:TopLevelFile & MpOnModifiedCloseRtpScan

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 1
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 1000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
if type(l_0_2) ~= "string" or l_0_2 == "" or type(l_0_3) ~= "string" or l_0_3 == "" or type(l_0_4) ~= "string" or l_0_4 == "" or l_0_4 == "-" then
  return mp.CLEAN
end
l_0_2, l_0_3, l_0_4 = string.lower(l_0_2), string.lower(l_0_3), string.lower(l_0_4)
if l_0_3 == "nt authority" and l_0_4 == "anonymous logon" then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
  mp.set_mpattribute("MpInternal_researchdata=SysvolPolicyNewSmbWriterStatus=" .. l_1_0)
end

local l_0_6, l_0_7 = Infrastructure_GetSysvolFilePath()
if l_0_7 then
  l_0_5(l_0_7)
end
if not l_0_6 then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
local l_0_8 = l_0_2 .. "\000" .. l_0_3 .. "\000" .. l_0_4
local l_0_9 = crypto.Sha1Buffer(l_0_8, 0, #l_0_8)
if not Infrastructure_IsNewSysvolWriter("SysvolSmbWriteHistory90d_v1", 7776000, l_0_9, "SysvolPolicyNewSmbWriterStatus") then
  return mp.CLEAN
end
local l_0_10 = l_0_6:match("\\([^\\]+)$")
if l_0_10 ~= "scheduledtasks.xml" and l_0_10 ~= "gpt.ini" then
  return mp.CLEAN
end
local l_0_11 = crypto.Sha1Buffer(l_0_3, 0, #l_0_3)
local l_0_12 = crypto.Sha1Buffer(l_0_4, 0, #l_0_4)
mp.set_mpattribute("MpInternal_researchdata=SysvolPolicyNewSmbWriter=" .. l_0_2 .. "|" .. l_0_11 .. "|" .. l_0_12 .. "|" .. l_0_10)
return mp.INFECTED
