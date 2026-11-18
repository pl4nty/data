-- Threat: !InfrastructureShared
-- Name: !#SLF:PWS:NPM/BadaStealer.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & SCPT:NpmY_Bada_EvalFunc & SCPT:NpmY_Bada_Tampered

local l_0_0 = mp.getfilesize()
if 512000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(tostring(l_0_1))
local l_0_2, l_0_3 = string.gsub(l_0_1, "charcodeat", "")
if l_0_3 < 3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = string.gsub(l_0_1, "buffer%[", "")
if l_0_5 < 5 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = string.gsub(l_0_1, "require%([%w_]+%.[%w_]+%(%d+%)%)", "")
if l_0_7 < 10 then
  return mp.CLEAN
end
return mp.INFECTED
