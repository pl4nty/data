-- Threat: Trojan:PowerShell/WebClipPaste.SB
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 80 or 8192 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 80 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if l_0_4 and type(l_0_5) == "string" and 0 < #l_0_5 then
    l_0_3 = l_0_5
  end
end
if #l_0_3 < 80 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = string.lower((string.gsub(l_0_3, "[%^`]", "")))
local l_0_7 = string.find(l_0_6, "iex(", 1, true) or string.find(l_0_6, "iex (", 1, true) or string.find(l_0_6, "|iex", 1, true) or string.find(l_0_6, "| iex", 1, true) or string.find(l_0_6, "invoke-expression", 1, true)
local l_0_8 = string.find(l_0_6, "irm ", 1, true) or string.find(l_0_6, "irm(", 1, true) or string.find(l_0_6, "invoke-restmethod", 1, true)
local l_0_9
if l_0_7 and l_0_8 and string.find(l_0_6, ".trycloudflare.com/api/loader/bootstrap/", 1, true) then
  l_0_9 = "bootstrap"
end
local l_0_10 = string.find(l_0_6, "iwr ", 1, true) or string.find(l_0_6, "iwr(", 1, true) or string.find(l_0_6, "invoke-webrequest", 1, true)
local l_0_11 = string.find(l_0_6, "-w h", 1, true) or string.find(l_0_6, "-windowstyle hidden", 1, true)
local l_0_12 = string.find(l_0_6, "-ep bypass", 1, true) or string.find(l_0_6, "-executionpolicy bypass", 1, true)
local l_0_13 = string.find(l_0_6, "i am not a robot", 1, true) or string.find(l_0_6, "no soy un robot", 1, true)
if l_0_9 == nil and l_0_7 and l_0_10 and l_0_11 and l_0_12 and l_0_13 and string.find(l_0_6, "cloudflare id:", 1, true) then
  l_0_9 = "hidden_bypass"
end
if l_0_9 == nil and l_0_13 and l_0_7 and string.find(l_0_6, "cloudflare id:", 1, true) and string.find(l_0_6, "frombase64string", 1, true) then
  l_0_9 = "base64"
end
if l_0_9 == nil and l_0_13 and l_0_10 and string.find(l_0_6, "cloudflare id:", 1, true) and string.find(l_0_6, "-outfile", 1, true) and string.find(l_0_6, "powershell", 1, true) and string.find(l_0_6, "-file", 1, true) then
  l_0_9 = "download_file"
end
local l_0_14 = string.find(l_0_6, "& $", 1, true) or string.find(l_0_6, "[convert]::toint32", 1, true)
if l_0_9 == nil and l_0_13 and l_0_10 and string.find(l_0_6, "cloudflare id:", 1, true) and string.find(l_0_6, "-bxor", 1, true) and l_0_14 then
  l_0_9 = "bxor"
end
local l_0_15 = string.find(l_0_6, "saps conhost", 1, true) or string.find(l_0_6, "start-process conhost", 1, true)
if l_0_9 == nil and l_0_15 and l_0_10 and string.find(l_0_6, "-headless", 1, true) and string.find(l_0_6, "powershell", 1, true) and string.find(l_0_6, "starting cloudflare verification", 1, true) then
  l_0_9 = "headless_conhost"
end
if l_0_9 == nil then
  return mp.CLEAN
end
local l_0_16 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_17, l_0_18, l_0_19, l_0_20, l_0_21 = FindRollingQueueContentMatch(l_0_16, l_0_3)
if not l_0_17 then
  return mp.CLEAN
end
local l_0_22 = tostring(l_0_9) .. "||" .. tostring(l_0_21) .. "||" .. tostring(l_0_18) .. "||" .. string.sub(tostring(l_0_20 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_19), 1, 320) .. "||" .. string.sub(tostring(l_0_3), 1, 320)
set_research_data("FakeVerifyDownload_B", l_0_22, false)
return mp.INFECTED
