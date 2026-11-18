-- Threat: !InfrastructureShared
-- Name: !#Lua:JsObfus.D
-- Type: 13
-- MpAttributes: Nscript:Type_js | Nscript:Type_vbs & Lua:JsObfusPathInclusion.A & RPF:TopLevelFile

local l_0_0 = string.lower(mp.getfilename())
local l_0_1 = string.sub(l_0_0, -4)
local l_0_2 = string.sub(l_0_0, -5)
if l_0_1 == ".exe" or l_0_1 == ".tmp" or l_0_2 == ".html" or l_0_1 == ".hta" or l_0_0:find("availabilitytest", 1, true) or l_0_0:find("mxescr", 1, true) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  if l_0_0:match("%->.+/") or l_0_0:match("%->.+\\") or l_0_0:match("%->.+%->") then
    return mp.CLEAN
  end
  local l_0_3 = 0
  if mp.get_mpattributesubstring("SCPT:JS/Obfus") or mp.get_mpattributesubstring("SCPT:TrojanDownloader:JS") or mp.get_mpattributesubstring("SCPT:Trojan:JS/Obfuse") or mp.get_mpattributesubstring("SCPT:TrojanDropper:JS/Obfuse") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("SCPT:Jenxcus") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("VBS/Obfus") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("SCPT:Kira") or mp.get_mpattributesubstring("SCPT:JS/HtmlSmuggling") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("SCPT:Obfusc") and not mp.get_mpattributesubstring("SCPT:Obfuscator.RandomInput") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("SCPT:SimpleAsciiObfuscator") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("SWF/Obfuscator") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("SCPT:charcode.A") or mp.get_mpattributesubstring("SCPT:JS/StringFromCharCodeCharCodeAt") or mp.get_mpattributesubstring("SCRIPT:StringFromCharCode.A") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("VBS/Obfuscator") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("SCPT:JS/parseInt") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("SCPT:JS/PushShift") then
    l_0_3 = l_0_3 + 2
  end
  if mp.get_mpattributesubstring("SCPT:Obfuscator.LongVariableName.A") then
    l_0_3 = l_0_3 + 2
  end
  if not (not mp.get_mpattributesubstring("TrojanDownloader:JS/Donvibs") or mp.get_mpattributesubstring("TrojanDownloader:JS/Donvibs.EH!atb01")) or mp.get_mpattributesubstring("SCPT:JS/Base64Func.A") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("SCRIPT:TrojanDownloader:JS/Nemucod") or mp.get_mpattributesubstring("SCPT:JS/Nemucod") or mp.get_mpattributesubstring("SCPT:JS/Gootkit") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("TrojanDownloader:HTML/Obfuse") or mp.get_mpattributesubstring("TrojanDownloader:JS/Obfuse") then
    l_0_3 = l_0_3 + 1
  end
  if mp.get_mpattributesubstring("Scpt:Trojan:JS/GootLoader") or mp.get_mpattributesubstring("SCPT:TrojanDownloader:O97M/Qakbot") then
    l_0_3 = l_0_3 + 2
  end
  if 5 <= l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
