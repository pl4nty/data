-- Threat: !InfrastructureShared
-- Name: 2929aa6a6b74
-- Type: 21

local l_0_0 = mp.getfilesize()
if 5120 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetNormalizedScript(true)
if l_0_1 ~= nil and string.find(l_0_1, "|base64-D|", 1, true) then
  local l_0_2 = l_0_1:match("echo%-e([%w%+%/%=]+)%|base64%-D")
  if #l_0_2 and #l_0_2 % 4 == 0 then
    local l_0_3 = MpCommon.Base64Decode(l_0_2)
    if #l_0_3 and l_0_3 ~= nil then
      mp.vfo_add_buffer(l_0_3, "[Base64DecData]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      if string.find(l_0_3, "| /bin/zsh", -10, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
