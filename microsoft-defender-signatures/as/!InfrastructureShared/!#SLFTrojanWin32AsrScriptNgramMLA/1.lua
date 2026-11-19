-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/AsrScriptNgramML.A
-- Type: 24
-- MpAttributes: !Lua:ProgrammingLangFileExtension & !ASRObfuscatedScriptExclusion

if not mp.IsHipsRuleEnabled("5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("Lua:FileInZip") and not mp.get_mpattribute("Lua:FileIn7z") and not mp.get_mpattribute("Lua:FileInRar") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Nscript:Type_js") and not mp.get_mpattribute("Nscript:Type_vbs") and not mp.get_mpattribute("Nscript:Type_ps") and not mp.get_mpattribute("Lua:JSExt") and not mp.get_mpattribute("Lua:VBSExt") and not mp.get_mpattribute("Lua:PS1Ext") and not mp.get_mpattribute("LUA:WSFExt") then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = false
local l_0_2 = string.match(l_0_0, "(%.[^%.]+)$")
if l_0_2 == ".psd1" or l_0_2 == ".psm1" or l_0_2 == ".ps1xml" or l_0_2 == ".psrc" or l_0_2 == ".pssc" or l_0_2 == ".cdxml" or l_0_2 == ".testpasses" then
  return mp.CLEAN
end
if l_0_2 == ".ps1" then
  l_0_1 = true
end
if not mp.get_mpattribute("RPF:ObfusJsVbs:Probability") then
  return mp.CLEAN
end
local l_0_3 = mp.get_mpattributevalue("RPF:ObfusJsVbs:Probability")
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 < 75 or 100 < l_0_3 then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() == 3 then
  l_0_4 = true
end
if mp.get_mpattribute("Lua:FileInZip") or mp.get_mpattribute("Lua:FileIn7z") or mp.get_mpattribute("Lua:FileInRar") then
  l_0_5 = true
  local l_0_7, l_0_8 = mp.UfsGetMetadataBool("Lua:ZipWithMotwAll", true)
  if l_0_7 == 0 and l_0_8 ~= nil then
    l_0_6 = true
  end
end
local l_0_9 = false
if l_0_1 == false then
  if l_0_6 == true and 85 <= l_0_3 then
    l_0_9 = true
  end
  if l_0_5 == true and 90 <= l_0_3 then
    l_0_9 = true
  end
  if l_0_4 == true and 95 <= l_0_3 then
    l_0_9 = true
  end
  if 99 <= l_0_3 then
    l_0_9 = true
  end
else
  if l_0_6 == true and 75 <= l_0_3 then
    l_0_9 = true
  end
  if l_0_5 == true and 80 <= l_0_3 then
    l_0_9 = true
  end
  if l_0_4 == true and 85 <= l_0_3 then
    l_0_9 = true
  end
  if 90 <= l_0_3 then
    l_0_9 = true
  end
end
if l_0_9 == false then
  return mp.CLEAN
end
local l_0_10, l_0_11 = mp.IsTrustedFile(false)
if l_0_10 == true then
  return mp.CLEAN
end
local l_0_12 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_12 == nil or l_0_12 == "" then
  return mp.CLEAN
end
l_0_12 = MpCommon.PathToWin32Path(l_0_12)
if l_0_12 == nil or l_0_12 == "" then
  return mp.CLEAN
end
l_0_12 = string.lower(l_0_12)
if mp.IsPathExcludedForHipsRule(l_0_12, "5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  if string.find(l_0_12, ">%[msilres") then
    mp.set_mpattribute("LUA:InsideMSILRES")
    return mp.CLEAN
  end
  local l_0_13 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_13 == nil or l_0_13 == "" then
    return mp.CLEAN
  end
  l_0_13 = string.lower(l_0_13)
  local l_0_14 = {
    ["cscript.exe"] = true,
    ["wscript.exe"] = true,
    ["winword.exe"] = true,
    ["powerpnt.exe"] = true,
    ["excel.exe"] = true,
    ["powershell.exe"] = true
  }
  if l_0_14[l_0_13] == true then
    if l_0_13 == "powershell.exe" then
      if l_0_1 then
        return mp.INFECTED
      end
    else
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
