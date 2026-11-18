-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/ShaHulud.ZZ!MTB
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
local r0_3, r0_4 = 0, 0
r0_3 = r0_3
  + str_count_match(r0_2,
    {
      ".aws/config", ".aws/credentials", ".azure/access", ".config/gcloud", ".docker/config",
      ".kube/config", ".npmrc", ".pypirc", ".netrc", ".ssh/id_rsa", ".ssh/id_ed25519",
      ".git-credentials", ".bitcoin/wallet.dat", ".ethereum/keystore"
    })
local r0_5 = str_count_match
r0_5 = r0_5(r0_2,
  {
    "gh[op]_[a-z0-9_%-%.]+", "npm_[a-z0-9_%-%.]+", "hvs%.[a-z0-9_%-]+", "akia[0-9a-z]+",
    "aws_access_key_id", "aws_secret_access_key", "aws_session_token", "eyjhbglcijo", "mongodb://",
    "mysql://", "postgres://", "redis://", "xox[%a]%-",
    "%-%-%-%-%-begin [a-z ]-private key%-%-%-%-%-", "ssh%-rsa", "ssh%-ed25519", '"auth"%s*:%s*"'
  })
local r0_6 = r0_4 + r0_5
if not (r0_3 < 3) and not (r0_6 < 3) then
  local r0_7 = string.find(r0_2, "process.env", 1, true)
  if r0_7
    or string.find(r0_2, "readfilesync", 1, true)
    or string.find(r0_2, "child_process", 1, true)
    or string.find(r0_2, "execsync", 1, true)
    or string.find(r0_2, "httppost", 1, true) then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
