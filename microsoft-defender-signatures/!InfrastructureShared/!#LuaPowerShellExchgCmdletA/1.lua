-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowerShellExchgCmdletA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and l_0_1 ~= nil and (string.sub)(l_0_1, 1, 12) == "BodyContent;" then
  local l_0_2 = nil
  l_0_2 = tostring(headerpage)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2:match("<rsp:Command>Get%-Mailbox</rsp:Command><rsp:Arguments>(.*)")
  if l_0_3 ~= nil and l_0_3 ~= "" then
    if #l_0_3 % 4 >= 1 then
      l_0_3 = l_0_3 .. (string.rep)("=", 4 - #l_0_3 % 4)
    end
    l_0_3 = (MpCommon.Base64Decode)(l_0_3)
    ;
    (mp.vfo_add_buffer)(l_0_3, "[ExchgCmdB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

