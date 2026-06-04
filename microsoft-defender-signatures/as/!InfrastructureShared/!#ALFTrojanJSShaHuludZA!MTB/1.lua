-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanJSShaHuludZA!MTB\1.luac 

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
  local l_0_6 = str_count_match
  local l_0_7 = l_0_4
  l_0_6 = l_0_6(l_0_7, {"npm_token", "npm_config_authtoken", "npm_config_registry", "github_token", "github_actions", "aws_access_key_id", "aws_secret_access_key", "aws_session_token", "artifactory_token", "nexus_token", "node_auth_token", "npm_config__auth"})
  l_0_5 = l_0_5 + l_0_6
  if l_0_5 < 3 then
    l_0_6 = mp
    l_0_6 = l_0_6.CLEAN
    return l_0_6
  end
  l_0_6 = string
  l_0_6 = l_0_6.find
  l_0_7 = l_0_4
  l_0_6 = l_0_6(l_0_7, "process.env", 1, true)
  if not l_0_6 then
    l_0_6 = string
    l_0_6 = l_0_6.find
    l_0_7 = l_0_4
    l_0_6 = l_0_6(l_0_7, "readfilesync", 1, true)
    if not l_0_6 then
      l_0_6 = string
      l_0_6 = l_0_6.find
      l_0_7 = l_0_4
      l_0_6 = l_0_6(l_0_7, "execsync", 1, true)
      if not l_0_6 then
        l_0_6 = string
        l_0_6 = l_0_6.find
        l_0_7 = l_0_4
        l_0_6 = l_0_6(l_0_7, "child_process", 1, true)
        if not l_0_6 then
          l_0_6 = string
          l_0_6 = l_0_6.find
          l_0_7 = l_0_4
          l_0_6 = l_0_6(l_0_7, "httppost", 1, true)
          if not l_0_6 then
            l_0_6 = mp
            l_0_6 = l_0_6.CLEAN
            return l_0_6
          end
        end
      end
    end
  end
  l_0_6 = mp
  l_0_6 = l_0_6.INFECTED
  return l_0_6
end

