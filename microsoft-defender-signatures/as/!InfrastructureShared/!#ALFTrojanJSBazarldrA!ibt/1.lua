-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:JS/Bazarldr.A!ibt
-- Type: 13
-- MpAttributes: Nscript:js_hasSelfModification & BM_ScriptFile & Nscript:Type_js & SCPT:JS/FunAttr & SCPT:JS/Var & SCPT:JS/Return

local l_0_0 = mp.getfilesize()
if 327680 < l_0_0 then
  return mp.CLEAN
end
if mp.FOOTERPAGE_SZ < 1792 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(footerpage))
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3 in string.gmatch(l_0_1, "function%(") do
  l_0_2 = l_0_2 + 1
  if 20 <= l_0_2 then
    break
  end
end
if l_0_2 < 20 then
  return mp.CLEAN
end
l_0_2 = 0
for l_0_4 in string.gmatch(l_0_1, "{var ") do
  l_0_2 = l_0_2 + 1
  if 10 <= l_0_2 then
    break
  end
end
if l_0_2 < 10 then
  return mp.CLEAN
end
l_0_2 = 0
for l_0_5 in string.gmatch(l_0_1, "return") do
  l_0_2 = l_0_2 + 1
  if 20 <= l_0_2 then
    break
  end
end
if l_0_2 < 20 then
  return mp.CLEAN
end
l_0_2 = 0
for l_0_6 in string.gmatch(l_0_1, "_0x") do
  l_0_2 = l_0_2 + 1
  if 250 <= l_0_2 then
    break
  end
end
if l_0_2 < 250 then
  return mp.CLEAN
end
return mp.INFECTED
