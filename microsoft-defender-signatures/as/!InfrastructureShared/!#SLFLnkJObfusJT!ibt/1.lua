-- Threat: !InfrastructureShared
-- Name: !#SLF:Lnk/JObfus.JT!ibt
-- Type: 13
-- MpAttributes: SCPT:LNK/SetAttr

local l_0_0 = mp.getfilesize()
if 20480 < l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("BM_LNK_FILE") and not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(64, l_0_0 - 64))
if l_0_1 == nil then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:LNK_Settings!IsUnicode") then
  l_0_1 = string.gsub(l_0_1, "%z", "")
  if l_0_1 == nil then
    return mp.CLEAN
  end
end
local l_0_2 = {}
local l_0_3 = 0
for l_0_4 in l_0_1:gmatch("[sS][Ee][Tt] [%w]+%s*=%s*[%w%.]+") do
  local l_0_5 = l_0_4:match("([sS][Ee][Tt] [%w.]+)", 1, true)
  if l_0_5 ~= nil and 5 < #l_0_5 then
    local l_0_6 = string.sub(l_0_5, 5)
    if l_0_6 == nil then
      return mp.CLEAN
    end
    if l_0_2[l_0_6] ~= 1 then
      local l_0_7 = "%" .. l_0_6 .. "%"
      local l_0_8 = "!" .. l_0_6 .. "!"
      local l_0_9 = "%" .. l_0_6 .. ":"
      l_0_2[l_0_6] = 1
      if l_0_1:find(l_0_7, 1, true) ~= nil then
        l_0_3 = l_0_3 + 1
        mp.set_mpattribute("Lua:LnkHasEnvWithPercent")
      elseif l_0_1:find(l_0_8, 1, true) ~= nil then
        l_0_3 = l_0_3 + 1
        mp.set_mpattribute("Lua:LnkHasEnvWithBang")
      elseif l_0_1:find(l_0_9, 1, true) ~= nil then
        l_0_3 = l_0_3 + 1
        mp.set_mpattribute("Lua:LnkHasEnvWithPercentColon")
      end
      if 2 < l_0_3 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
