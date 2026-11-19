-- Threat: !InfrastructureShared
-- Name: !#Lua:CMDEmbedRunExecute
-- Type: 13
-- MpAttributes: SCRIPT:CMDEmbedRunExecute

local l_0_0 = string.lower(tostring(footerpage))
local l_0_1 = {
  "(%(\"cmd.exe.+%);)",
  "(\"cmd.exe /c .+%);)"
}
local l_0_2 = #l_0_1
local l_0_3
for l_0_4 = 1, l_0_2 do
  l_0_3 = string.match(l_0_0, l_0_1[l_0_4])
  if l_0_3 then
    l_0_0 = l_0_3
    break
  end
end
if l_0_3 then
  local l_0_5, l_0_6 = string.gsub(l_0_0, "%^", "")
  if l_0_5 and 20 < l_0_6 then
    l_0_5 = string.gsub(l_0_5, "[ \n\r\t]", "")
    mp.vfo_add_buffer(l_0_5, "[CMDEmbedded]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
