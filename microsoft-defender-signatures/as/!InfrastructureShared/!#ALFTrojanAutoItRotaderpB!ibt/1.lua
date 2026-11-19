-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AutoIt/Rotaderp.B!ibt
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile & BM_TEXT_FILE & SCPT:SymbolAT

local l_0_0 = mp.getfilesize()
if 20480 < l_0_0 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1792 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = 0
for l_0_4 in l_0_1:gmatch("[s][e][t] [%w]+%s*=%s*[%w%.]+") do
  local l_0_5 = l_0_4:match("([s][e][t] [%w.]+)", 1, true)
  if l_0_5 ~= nil and 5 < #l_0_5 then
    local l_0_6 = string.sub(l_0_5, 5)
    if l_0_6 == nil then
      return mp.CLEAN
    end
    if l_0_2[l_0_6] ~= 1 then
      local l_0_7 = "%" .. l_0_6 .. "%"
      l_0_2[l_0_6] = 1
      if l_0_1:find(l_0_7, 1, true) ~= nil then
        l_0_3 = l_0_3 + 1
        mp.set_mpattribute("Lua:ScrHasEnvWithPercent")
      else
        return mp.CLEAN
      end
      if 5 < l_0_3 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
