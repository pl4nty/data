-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32AsrScriptNgramMLA\0x00001be9_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("RPF:TopLevelFile") and not (mp.get_mpattribute)("Lua:FileInZip") and not (mp.get_mpattribute)("Lua:FileIn7z") and not (mp.get_mpattribute)("Lua:FileInRar") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Nscript:Type_js") and not (mp.get_mpattribute)("Nscript:Type_vbs") and not (mp.get_mpattribute)("Nscript:Type_ps") and not (mp.get_mpattribute)("Lua:JSExt") and not (mp.get_mpattribute)("Lua:VBSExt") and not (mp.get_mpattribute)("Lua:PS1Ext") and not (mp.get_mpattribute)("LUA:WSFExt") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = false
local l_0_2 = (string.match)(l_0_0, "(%.[^%.]+)$")
if l_0_2 == ".psd1" or l_0_2 == ".psm1" or l_0_2 == ".ps1xml" or l_0_2 == ".psrc" or l_0_2 == ".pssc" or l_0_2 == ".cdxml" or l_0_2 == ".testpasses" then
  return mp.CLEAN
end
if l_0_2 == ".ps1" then
  l_0_1 = true
end
if not (mp.get_mpattribute)("RPF:ObfusJsVbs:Probability") then
  return mp.CLEAN
end
local l_0_3 = (mp.get_mpattributevalue)("RPF:ObfusJsVbs:Probability")
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 < 75 or l_0_3 > 100 then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and (mp.GetMOTWZone)() == 3 then
  l_0_4 = true
end
if (mp.get_mpattribute)("Lua:FileInZip") or (mp.get_mpattribute)("Lua:FileIn7z") or (mp.get_mpattribute)("Lua:FileInRar") then
  l_0_5 = true
  if (mp.UfsGetMetadataBool)("Lua:ZipWithMotwAll", true) == 0 and "Lua:ZipWithMotwAll" ~= nil then
    l_0_6 = true
  end
end
local l_0_7 = false
if l_0_1 == false then
  if l_0_6 == true and l_0_3 >= 85 then
    l_0_7 = true
  end
  if l_0_5 == true and l_0_3 >= 90 then
    l_0_7 = true
  end
  if l_0_4 == true and l_0_3 >= 95 then
    l_0_7 = true
  end
  if l_0_3 >= 99 then
    l_0_7 = true
  end
else
  if l_0_6 == true and l_0_3 >= 75 then
    l_0_7 = true
  end
  if l_0_5 == true and l_0_3 >= 80 then
    l_0_7 = true
  end
  if l_0_4 == true and l_0_3 >= 85 then
    l_0_7 = true
  end
  if l_0_3 >= 90 then
    l_0_7 = true
  end
end
if l_0_7 == false then
  return mp.CLEAN
end
local l_0_8, l_0_9 = (mp.IsTrustedFile)(false)
if l_0_8 == true then
  return mp.CLEAN
end
local l_0_10 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_10 == nil or l_0_10 == "" then
  return mp.CLEAN
end
l_0_10 = (MpCommon.PathToWin32Path)(l_0_10)
if l_0_10 == nil or l_0_10 == "" then
  return mp.CLEAN
end
l_0_10 = (string.lower)(l_0_10)
if (mp.IsPathExcludedForHipsRule)(l_0_10, "5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableCaching")
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  if (string.find)(l_0_10, ">%[msilres") then
    (mp.set_mpattribute)("LUA:InsideMSILRES")
    return mp.CLEAN
  end
  local l_0_11 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_11 == nil or l_0_11 == "" then
    return mp.CLEAN
  end
  l_0_11 = (string.lower)(l_0_11)
  local l_0_12 = {}
  l_0_12["cscript.exe"] = true
  l_0_12["wscript.exe"] = true
  l_0_12["winword.exe"] = true
  l_0_12["powerpnt.exe"] = true
  l_0_12["excel.exe"] = true
  l_0_12["powershell.exe"] = true
  -- DECOMPILER ERROR at PC347: Unhandled construct in 'MakeBoolean' P1

  if l_0_12[l_0_11] == true and l_0_11 == "powershell.exe" and l_0_1 then
    return mp.INFECTED
  end
end
do
  do return mp.INFECTED end
  return mp.CLEAN
end

