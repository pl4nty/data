-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:JS/SuspScripExec.ZE!MTB
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: JAM:StreamWriteLinePrev & SCPT:VBSCreateTextFile & SCRIPT:VBS/Spawn & SCPT:wmiProcStartObjCreateInstance.A & MpIsJScriptAMSIScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
mp.readprotection(true)
if r0_1 == "" then
  return mp.CLEAN
end
local r0_2 = string.match(r0_1, "%$([%w_]+)%s*=%s*'([A-Za-z0-9+/=\r\n]+)")
if r0_2 == nil then
  return mp.CLEAN
end
local r0_3 = #r0_2 - #r0_2 % 4
r0_2 = string.sub(r0_2, 1, r0_3)
local r0_4 = MpCommon.Base64Decode(r0_2)
if r0_4 == nil then
  return mp.CLEAN
end
r0_4 = string.gsub(r0_4, "%z", "")
r0_4 = string.lower(r0_4)
local r0_5 = {
  "invoke-command", "invoke-expression", "writeallbytes", "writealltext", "iex", "iwr", "irm",
  "curl", "invoke-restmethod", "invoke-webrequest", "downloadstring", "downloadfile", "http://",
  "https://"
}
if contains(r0_4, r0_5) then
  return mp.INFECTED
end
return mp.CLEAN
