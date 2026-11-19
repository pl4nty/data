-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/JSExec.SC
-- Type: 24
-- MpAttributes: Implicit:FileNameEQbinding.gyp

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < 100 or 524288 < l_0_1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
mp.readprotection(true)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_2, "\\U%x%x%x%x%x%x%x%x") do
  l_0_3 = l_0_3 + 1
  if 64 <= l_0_3 then
    break
  end
end
local l_0_5 = 0
if l_0_3 < 8 then
  for l_0_6 in string.gmatch(l_0_2, "\\u%x%x%x%x") do
    l_0_5 = l_0_5 + 1
    if 128 <= l_0_5 then
      break
    end
  end
end
if l_0_3 < 8 and l_0_5 < 16 then
  return mp.CLEAN
end
local l_0_7 = string.lower(l_0_2)
local l_0_8 = {
  "__subclasses__",
  "__class__.__base__",
  "__class__.__bases__",
  "__mro__",
  "__builtins__",
  "__globals__"
}
local l_0_9
for l_0_10, l_0_11 in ipairs(l_0_8) do
  if string.find(l_0_7, l_0_11, 1, true) then
    l_0_9 = l_0_11
    break
  end
end
if l_0_9 == nil then
  return mp.CLEAN
end
local l_0_12 = {}
for l_0_13 in string.gmatch(l_0_2, "\\U(%x%x%x%x%x%x%x%x)") do
  local l_0_14 = tonumber(l_0_13, 16)
  if l_0_14 and l_0_14 < 128 then
    l_0_12[#l_0_12 + 1] = string.char(l_0_14)
  else
    l_0_12[#l_0_12 + 1] = " "
  end
end
for l_0_15 in string.gmatch(l_0_2, "\\u(%x%x%x%x)") do
  local l_0_16 = tonumber(l_0_15, 16)
  if l_0_16 and l_0_16 < 128 then
    l_0_12[#l_0_12 + 1] = string.char(l_0_16)
  else
    l_0_12[#l_0_12 + 1] = " "
  end
end
local l_0_17 = string.lower(table.concat(l_0_12))
if #l_0_17 < 8 then
  return mp.CLEAN
end
local l_0_18 = {
  "catch_warnings",
  "__import__",
  "__builtins__",
  "__subclasses__",
  "os.system",
  "node ",
  "subprocess",
  "popen",
  ".system",
  "eval",
  "exec"
}
local l_0_19 = {}
for l_0_20, l_0_21 in ipairs(l_0_18) do
  if string.find(l_0_17, l_0_21, 1, true) then
    l_0_19[#l_0_19 + 1] = l_0_21
  end
end
if #l_0_19 < 2 then
  return mp.CLEAN
end
return mp.INFECTED
