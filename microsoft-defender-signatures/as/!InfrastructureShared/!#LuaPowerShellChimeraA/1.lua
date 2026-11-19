-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/Chimera.A
-- Type: 13
-- MpAttributes: (RPF:TopLevelFile | MpIsAMSIScan) & (Lua:PS1Ext | MpIsPowerShellAMSIScan) & !SCRIPT:SignedPSscript.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 7340032 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.gsub(tostring(headerpage), " ", "")
local l_0_2 = string.match(l_0_1, "^#[A-Za-z%.]+")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2:len() < 40 then
  return mp.CLEAN
end
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8
for l_0_9 in l_0_1:gmatch([[
([^
]*)
?]]) do
  l_0_8 = string.match(l_0_9, "^#[%a%d%.]+$")
  if l_0_8 then
    if l_0_8:len() > 100 then
      l_0_4 = l_0_4 + 1
    elseif l_0_8:len() > 40 then
      l_0_3 = l_0_3 + 1
    end
  else
    l_0_8 = string.match(l_0_9, "^%$[%a%d]+=\"[%a%d`%.]+\"$")
    if l_0_8 and l_0_8:len() >= 18 then
      if l_0_8:len() > 80 then
        l_0_6 = l_0_6 + 1
      else
        l_0_5 = l_0_5 + 1
      end
    elseif string.len(l_0_9) > 3 then
      l_0_8 = string.match(l_0_9, "^%$%a+")
      if not l_0_8 or l_0_8:len() < 20 then
        l_0_7 = l_0_7 + 1
        if 10 <= l_0_7 then
          return mp.CLEAN
        end
      end
    end
  end
end
local l_0_10 = false
if 2 <= l_0_4 and 2 <= l_0_6 or 2 <= l_0_4 and 1 <= l_0_6 and l_0_7 <= 1 or 10 <= l_0_3 and 5 <= l_0_5 then
  l_0_10 = true
end
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = string.gsub(tostring(footerpage), " ", "")
local l_0_12 = false
local l_0_13
for l_0_14 in l_0_11:gmatch([[
([^
]*)
?]]) do
  l_0_13 = string.match(l_0_14, "^#[%a%d%.]+$")
  if l_0_13 and string.len(l_0_13) > 40 then
    l_0_12 = true
    break
  end
  l_0_8 = string.match(l_0_14, "[%w%+/]+")
  if l_0_8 and string.len(l_0_8) > 18 then
    l_0_12 = true
    break
  end
end
if l_0_12 then
  return mp.INFECTED
end
return mp.CLEAN
