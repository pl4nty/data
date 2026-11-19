-- Threat: !InfrastructureShared
-- Name: !#GGUF:SUSP_STRING
-- Type: 13
-- MpAttributes: MpIsGGUFChatTemplateScan

local l_0_0 = {
  ["GGUF_CRIT:builtins"] = 1,
  ["GGUF_CRIT:Exec"] = 1,
  ["GGUF_CRIT:Network"] = 1,
  ["GGUF_CRIT:FileIO"] = 1,
  ["GGUF_CRIT:SysUtils"] = 1
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  local l_0_4 = mp.get_mpattribute(l_0_2)
  if l_0_4 then
    l_0_1 = l_0_1 + l_0_3
    if 2 <= l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
