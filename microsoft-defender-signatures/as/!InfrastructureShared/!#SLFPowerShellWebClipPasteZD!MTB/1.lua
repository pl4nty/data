-- Threat: !InfrastructureShared
-- Name: !#SLF:PowerShell/WebClipPaste.ZD!MTB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:SetAnd.A & (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 32 or 16384 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 32 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if l_0_4 and type(l_0_5) == "string" and 0 < #l_0_5 then
    l_0_3 = l_0_5
  end
end
if #l_0_3 < 32 or 16384 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_3)
l_0_6 = string.gsub(l_0_6, "\\1%s*$", "")
l_0_6 = string.gsub(l_0_6, "%z", "")
l_0_6 = string.gsub(l_0_6, "%^(.)", "%1")
l_0_6 = string.gsub(l_0_6, "`(.)", "%1")
l_0_6 = string.gsub(l_0_6, "%%comspec%%", "cmd.exe")
l_0_6 = string.gsub(l_0_6, "%%localappdata%%", "localappdata")
l_0_6 = string.gsub(l_0_6, "%%temp%%", "temp")
local l_0_7 = string.find(l_0_6, "/v:on", 1, true) or string.find(l_0_6, "/v ", 1, true) or string.find(l_0_6, "/v\t", 1, true)
local l_0_8 = string.find(l_0_6, "&set ", 1, true) or string.find(l_0_6, "& set ", 1, true) or string.find(l_0_6, "(set ", 1, true) or string.find(l_0_6, " set ", 1, true) or string.match(l_0_6, "^set%s+")
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {}

local function l_0_10(l_1_0)
  l_1_0 = string.gsub(l_1_0, "^%s+", "")
  l_1_0 = string.gsub(l_1_0, "%s+$", "")
  return l_1_0
end

local function l_0_11(l_2_0, l_2_1)
  if type(l_2_0) ~= "string" or type(l_2_1) ~= "string" then
    return
  end
  l_2_0 = string.lower(l_0_10(l_2_0))
  l_2_1 = l_0_10(l_2_1)
  l_2_1 = string.gsub(l_2_1, "^\"", "")
  l_2_1 = string.gsub(l_2_1, "\"$", "")
  if 0 < #l_2_0 and #l_2_0 <= 32 and #l_2_1 <= 512 then
    l_0_9[l_2_0] = l_2_1
  end
end

local l_0_12 = "&" .. l_0_6
for l_0_13, l_0_14 in string.gmatch(l_0_12, "[&|%(]%s*set%s+[\"']?([%w_]+)%s*=%s*([^&|\r\n%)]+)") do
  l_0_11(l_0_13, l_0_14)
end
for l_0_15, l_0_16 in string.gmatch(l_0_6, "set%s+[\"']?([%w_]+)%s*=%s*([^&|\r\n%)]+)") do
  if l_0_9[string.lower(l_0_15)] == nil then
    l_0_11(l_0_15, l_0_16)
  end
end
local l_0_17 = l_0_6
if l_0_7 then
  for l_0_18 = 1, 10 do
    do
      local l_0_19 = false
      l_0_17 = string.gsub(l_0_17, "!([%w_]+)!", function(l_3_0)
        local l_3_1 = l_0_9[string.lower(l_3_0)]
        if l_3_1 ~= nil then
          l_0_19 = true
          return l_3_1
        end
        return "!" .. l_3_0 .. "!"
      end)
      if not l_0_19 then
        break
      end
    end
  end
end
l_0_17 = string.gsub(l_0_17, "%^", "")
l_0_17 = string.gsub(l_0_17, "`", "")
l_0_17 = string.gsub(l_0_17, "[\"']", "")
l_0_17 = string.gsub(l_0_17, "[\r\n\t]+", " ")
l_0_17 = string.gsub(l_0_17, "%s+", " ")
local l_0_20 = string.gsub(l_0_17, "[^%w%.:/\\]", "")
local l_0_21 = string.find(l_0_17, "powershell", 1, true) or string.find(l_0_17, "powershell.exe", 1, true) or string.find(l_0_20, "powershell", 1, true)
local l_0_22 = string.find(l_0_17, "curl.exe", 1, true) or string.find(l_0_17, "curl ", 1, true) or string.find(l_0_20, "curl.exe", 1, true)
local l_0_23 = string.find(l_0_17, "mshta.exe", 1, true) or string.find(l_0_17, "mshta ", 1, true) or string.find(l_0_20, "mshta.exe", 1, true)
if not l_0_21 and not l_0_22 and not l_0_23 then
  return mp.CLEAN
end
local l_0_24 = string.find(l_0_17, "/c ", 1, true) or string.find(l_0_17, "cmd.exe", 1, true) or string.find(l_0_17, "conhost", 1, true) or string.find(l_0_17, "start ", 1, true) or string.find(l_0_17, "pcalua", 1, true) or string.find(l_0_17, "-file ", 1, true) or string.find(l_0_17, "-ep bypass", 1, true) or string.find(l_0_17, "-executionpolicy bypass", 1, true) or string.find(l_0_17, "-slo ", 1, true) or string.find(l_0_17, "-sklo ", 1, true) or string.find(l_0_17, "http://", 1, true) or string.find(l_0_17, "https://", 1, true)
if not l_0_24 then
  return mp.CLEAN
end
local l_0_25 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_26 = FindRollingQueueContentMatch(l_0_25, l_0_3)
if not l_0_26 then
  return mp.CLEAN
end
return mp.INFECTED
