-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/ShaHulud.ZA!MTB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:NodeReqChildProc & SCRIPT:ReadFileSync & SCRIPT:WriteFileSync & BM_XPLAT_OR_WIN_SCRIPT_FILE_TYPE

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
r0_0 = (r0_0 == nil or r0_0 > 3145728) and 3145728 or r0_0
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
if r0_1 == "" then
  return mp.CLEAN
end
local r0_2 = string.lower(r0_1)
if 0
  + str_count_match(r0_2,
    {
      "npm_token", "npm_config_authtoken", "npm_config_registry", "github_token", "github_actions",
      "aws_access_key_id", "aws_secret_access_key", "aws_session_token", "artifactory_token",
      "nexus_token", "node_auth_token", "npm_config__auth"
    })
  < 3 then
  return mp.CLEAN
end
local r0_3 = string.find(r0_2, "process.env", 1, true)
if r0_3
  or string.find(r0_2, "readfilesync", 1, true)
  or string.find(r0_2, "execsync", 1, true)
  or string.find(r0_2, "child_process", 1, true)
  or string.find(r0_2, "httppost", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
