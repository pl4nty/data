-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJSShaHuludZZ!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 3145728 then
  l_0_0 = 3145728
end
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2 = tostring((mp.readfile)(0, l_0_0)) or ""
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  local l_0_4 = (string.lower)(l_0_1)
  local l_0_5 = 0
  local l_0_6 = 0
  local l_0_7 = str_count_match
  local l_0_8 = l_0_4
  l_0_7 = l_0_7(l_0_8, {".aws/config", ".aws/credentials", ".azure/access", ".config/gcloud", ".docker/config", ".kube/config", ".npmrc", ".pypirc", ".netrc", ".ssh/id_rsa", ".ssh/id_ed25519", ".git-credentials", ".bitcoin/wallet.dat", ".ethereum/keystore"})
  l_0_5 = l_0_5 + l_0_7
  l_0_7 = str_count_match
  l_0_8 = l_0_4
  l_0_7 = l_0_7(l_0_8, {"gh[op]_[a-z0-9_%-%.]+", "npm_[a-z0-9_%-%.]+", "hvs%.[a-z0-9_%-]+", "akia[0-9a-z]+", "aws_access_key_id", "aws_secret_access_key", "aws_session_token", "eyjhbglcijo", "mongodb://", "mysql://", "postgres://", "redis://", "xox[%a]%-", "%-%-%-%-%-begin [a-z ]-private key%-%-%-%-%-", "ssh%-rsa", "ssh%-ed25519", "\"auth\"%s*:%s*\""})
  l_0_6 = l_0_6 + l_0_7
  if l_0_5 < 3 or l_0_6 < 3 then
    l_0_7 = mp
    l_0_7 = l_0_7.CLEAN
    return l_0_7
  end
  l_0_7 = string
  l_0_7 = l_0_7.find
  l_0_8 = l_0_4
  l_0_7 = l_0_7(l_0_8, "process.env", 1, true)
  if not l_0_7 then
    l_0_7 = string
    l_0_7 = l_0_7.find
    l_0_8 = l_0_4
    l_0_7 = l_0_7(l_0_8, "readfilesync", 1, true)
    if not l_0_7 then
      l_0_7 = string
      l_0_7 = l_0_7.find
      l_0_8 = l_0_4
      l_0_7 = l_0_7(l_0_8, "child_process", 1, true)
      if not l_0_7 then
        l_0_7 = string
        l_0_7 = l_0_7.find
        l_0_8 = l_0_4
        l_0_7 = l_0_7(l_0_8, "execsync", 1, true)
        if not l_0_7 then
          l_0_7 = string
          l_0_7 = l_0_7.find
          l_0_8 = l_0_4
          l_0_7 = l_0_7(l_0_8, "httppost", 1, true)
          if not l_0_7 then
            l_0_7 = mp
            l_0_7 = l_0_7.CLEAN
            return l_0_7
          end
        end
      end
    end
  end
  l_0_7 = mp
  l_0_7 = l_0_7.INFECTED
  return l_0_7
end

