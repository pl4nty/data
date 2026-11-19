-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/ExchgCmdlet.A
-- Type: 13
-- MpAttributes: AGGR:ExchgGetMailbox

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and l_0_1 ~= nil and string.sub(l_0_1, 1, 12) == "BodyContent;" then
  local l_0_2
  l_0_2 = tostring(headerpage)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2:match("<rsp:Command>Get%-Mailbox</rsp:Command><rsp:Arguments>(.*)")
  if l_0_3 ~= nil and l_0_3 ~= "" then
    if 1 <= #l_0_3 % 4 then
      l_0_3 = l_0_3 .. string.rep("=", 4 - #l_0_3 % 4)
    end
    l_0_3 = MpCommon.Base64Decode(l_0_3)
    mp.vfo_add_buffer(l_0_3, "[ExchgCmdB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
