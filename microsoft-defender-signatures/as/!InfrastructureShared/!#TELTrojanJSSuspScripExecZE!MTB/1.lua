-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanJSSuspScripExecZE!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2, l_0_3, l_0_4 = tostring((mp.readfile)(0, l_0_0)) or ""
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_5 = nil
  if (string.match)(l_0_1, "%$([%w_]+)%s*=%s*\'([A-Za-z0-9+/=\r\n]+)") == nil then
    return mp.CLEAN
  end
  local l_0_6 = nil
  l_0_6 = (string.sub)(l_0_6, 1, #(string.match)(l_0_1, "%$([%w_]+)%s*=%s*\'([A-Za-z0-9+/=\r\n]+)") - #(string.match)(l_0_1, "%$([%w_]+)%s*=%s*\'([A-Za-z0-9+/=\r\n]+)") % 4)
  local l_0_7 = nil
  if (MpCommon.Base64Decode)(l_0_6) == nil then
    return mp.CLEAN
  end
  local l_0_8 = (string.lower)((string.gsub)((MpCommon.Base64Decode)(l_0_6), "%z", ""))
  if not contains(l_0_8, {"invoke-command", "invoke-expression", "writeallbytes", "writealltext", "iex", "iwr", "irm", "curl", "invoke-restmethod", "invoke-webrequest", "downloadstring", "downloadfile", "http://", "https://"}) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

