-- Threat: !InfrastructureShared
-- Name: !#Lua:JsEop.A
-- Type: 13
-- MpAttributes: InEmail & (Html_file | Lua:HTMLExt | SCPT:HTMLFile) & !Exclusion:EopJs

local l_0_0 = {
  "ALF:Trojan:HTML/Phish",
  "ALF:Trojan:HTML/Obfuse",
  "ALF:Trojan:JS/Phish",
  "ALF:EmailAddressInHtmlScript"
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  local l_0_4 = mp.enum_mpattributesubstring(l_0_3)
  if l_0_4 ~= nil and type(l_0_4) == "table" then
    l_0_1 = l_0_1 + #l_0_4
    if 3 <= l_0_1 then
      return mp.INFECTED
    end
  end
end
local l_0_5 = {
  "SCRIPT:JS/JSObfuscator",
  "SCPT:Trojan:HTML/Phish",
  "SCPT:TrojanDownloader:HTML/Obfuse",
  "SCRIPT:JS/DocWrite",
  "SCRIPT:JS/CryptoJS",
  "SCRIPT:HTML/Redirec",
  "SCRIPT:JS/Eval",
  "HtmlWithEmbedded"
}
local l_0_6 = 0
for l_0_7, l_0_8 in pairs(l_0_5) do
  local l_0_9 = mp.enum_mpattributesubstring(l_0_8)
  if l_0_9 ~= nil and type(l_0_9) == "table" then
    l_0_6 = #l_0_9 + l_0_6
    if l_0_1 == 0 and 5 <= l_0_6 then
      return mp.INFECTED
    elseif 1 <= l_0_1 and 4 <= l_0_6 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
