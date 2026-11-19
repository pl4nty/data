-- Threat: !InfrastructureShared
-- Name: !#TEL:LUA:Dosfuscator
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= "cmd.exe" and not mp.get_mpattribute("BM_CMD_EXE") then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.len(l_0_3)
if l_0_4 < 1000 then
  return mp.CLEAN
end
local l_0_5 = l_0_4
if 1000 < l_0_5 then
  l_0_5 = 1000
end
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = 0
local l_0_10 = 0
local l_0_11 = false
l_0_3 = string.gsub(l_0_3, " ", 30)
_, l_0_7 = string.gsub(l_0_3, "#", 10)
_, l_0_8 = string.gsub(l_0_3, ",", 30)
_, l_0_9 = string.gsub(l_0_3, "[%(%)]", 30)
_, l_0_10 = string.gsub(l_0_3, ";;", "", 30)
if 30 <= l_0_10 then
  mp.set_mpattribute("LUA:Dosfuscator2Semicolon")
  l_0_11 = true
end
local l_0_12 = string.gsub(l_0_3, "%^[&<>%^|\\]", "")
_, l_0_6 = string.gsub(l_0_12, "%^", "", 30)
if 30 <= l_0_6 then
  mp.set_mpattribute("LUA:DosfuscatorExp")
  l_0_11 = true
end
if 10 < l_0_7 then
  mp.set_mpattribute("LUA:DosfuscatorSharp")
  l_0_11 = true
end
if 30 < l_0_8 then
  mp.set_mpattribute("LUA:DosfuscatorComma")
  l_0_11 = true
end
if 30 < l_0_9 then
  mp.set_mpattribute("LUA:DosfuscatorParenthesis")
  l_0_11 = true
end
if l_0_11 then
  return mp.INFECTED
end
return mp.CLEAN
