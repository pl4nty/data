-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFASRCALL5beb7efe-fd9a-4556-801d-275e5ffc04cc\1_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (mp.get_mpattribute)("RPF:TopLevelFile") == false and (string.find)(l_0_0, "\\appdata\\local\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = false
if ((mp.get_mpattribute)("SCPT:ObfuscatedScriptAsrTestSample") or (mp.get_mpattribute)("SCPT:PS:ReflectiveInject") or (mp.get_mpattribute)("AsrMatch5beb7efe") or (not (mp.get_mpattribute)("ALF:Script/ObfusSingleJsInZipMsit.B") and not (mp.get_mpattribute)("ALF:Script/ObfusSingleJsInZipMsit.A") and not (mp.get_mpattribute)("SLF:Script/VbsInMotw.B") and not (mp.get_mpattribute)("SLF:Script/VbsInMotw.A") and not (mp.get_mpattribute)("SLF:Script/JsInMotw.B") and not (mp.get_mpattribute)("SLF:Script/JsInMotw.A")) or (mp.get_mpattribute)("Lua:MsitOrg")) then
  l_0_1 = true
end
local l_0_2 = false
local l_0_3 = false
if l_0_1 == false then
  if not (mp.get_mpattribute)("Nscript:Type_js") and not (mp.get_mpattribute)("Nscript:Type_vbs") and not (mp.get_mpattribute)("Nscript:Type_ps") and not (mp.get_mpattribute)("Lua:JSExt") and not (mp.get_mpattribute)("Lua:VBSExt") and not (mp.get_mpattribute)("Lua:PS1Ext") and not (mp.get_mpattribute)("LUA:WSFExt") then
    return mp.CLEAN
  end
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  l_0_4 = (string.lower)(l_0_4)
  local l_0_5 = (string.match)(l_0_4, "(%.[^%.]+)$")
  if l_0_5 == ".psd1" or l_0_5 == ".psm1" or l_0_5 == ".ps1xml" or l_0_5 == ".psrc" or l_0_5 == ".pssc" or l_0_5 == ".cdxml" or l_0_5 == ".testpasses" then
    return mp.CLEAN
  end
  if l_0_5 == ".ps1" then
    l_0_2 = true
  end
  if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and (mp.GetMOTWZone)() == 3 then
    l_0_3 = true
  end
  if not (mp.get_mpattribute)("RPF:TobeetJs:Probability") then
    return mp.CLEAN
  end
  local l_0_6 = (mp.get_mpattributevalue)("RPF:TobeetJs:Probability")
  if l_0_6 ~= nil then
    if l_0_2 == false and l_0_3 == false and l_0_6 >= 95 then
      l_0_1 = true
    end
    if l_0_2 == false and l_0_3 == true and l_0_6 >= 90 then
      l_0_1 = true
    end
    if l_0_2 == true and l_0_3 == false and l_0_6 >= 99 then
      l_0_1 = true
    end
    if l_0_2 == true and l_0_3 == true and l_0_6 >= 95 then
      l_0_1 = true
    end
  end
end
do
  if l_0_1 == false then
    return mp.CLEAN
  end
  local l_0_7, l_0_8 = (mp.IsTrustedFile)(false)
  if l_0_7 == true then
    return mp.CLEAN
  end
  if (mp.IsPathExcludedForHipsRule)(l_0_0, "5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\appdata\\roaming\\microsoft\\office\\16.0\\[^\\]+\\proofing\\") then
    return mp.CLEAN
  else
    if (string.find)(l_0_0, "\\appdata\\roaming\\microsoft\\office\\recent\\index.dat", 1, true) then
      return mp.CLEAN
    else
      if (string.find)(l_0_0, "\\program files[^\\]*\\microsoft office\\root\\office%d+\\") then
        return mp.CLEAN
      else
        if (string.find)(l_0_0, "\\windows\\imecache\\[^\\]+\\appdeploytoolkit\\appdeploytoolkitmain.cs") then
          return mp.CLEAN
        else
          if (string.find)(l_0_0, "\\windows\\ccmcache\\[^\\]+\\appdeploytoolkit\\appdeploytoolkitmain.cs") then
            return mp.CLEAN
          else
            if (string.find)(l_0_0, "\\windowspowershell\\v1.0\\modules\\", 1, true) then
              return mp.CLEAN
            else
              if (string.find)(l_0_0, "\\eceagentservice\\[^\\]+\\[^\\]+%.psd1$") then
                return mp.CLEAN
              else
                if (string.find)(l_0_0, "\\tanium\\tanium client\\tools\\endusernotifications\\", 1, true) then
                  return mp.CLEAN
                else
                  if (string.find)(l_0_0, "\\tanium\\tanium client\\tools\\enforce\\", 1, true) then
                    return mp.CLEAN
                  else
                    if (string.find)(l_0_0, "\\tanium\\tanium client\\downloads\\action_[^\\]+\\[^\\]+%.vbs$") then
                      return mp.CLEAN
                    else
                      if (string.find)(l_0_0, "\\sar\\rules\\[^\\]+\\rulefiles\\lib\\[^\\]+%.vbs$") then
                        return mp.CLEAN
                      else
                        local l_0_9 = (versioning.GetOrgID)()
                        if l_0_9 ~= nil and l_0_9 ~= "" then
                          l_0_9 = (string.lower)(l_0_9)
                          if (l_0_9 == "cd568033-6cdd-4daf-9263-45f282f27ae9" or l_0_9 == "ccf4632d-a216-4a0a-88ec-332cacb9ccfc" or l_0_9 == "84de09f9-73cb-4ba3-9eb5-c44b04ecaefd") and (string.find)(l_0_0, "\\appdata\\local\\temp\\mxescr%d+%.vbs$") then
                            return mp.CLEAN
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  do
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
      if (string.find)(l_0_0, ">%[msilres") then
        (mp.set_mpattribute)("LUA:InsideMSILRES")
        return mp.CLEAN
      end
      if (mp.get_mpattribute)("LUA:InsideMSILRES") then
        return mp.CLEAN
      end
      local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
      if l_0_10 == nil or l_0_10 == "" then
        return mp.CLEAN
      end
      l_0_10 = (string.lower)(l_0_10)
      local l_0_11 = {}
      l_0_11["cscript.exe"] = true
      l_0_11["wscript.exe"] = true
      l_0_11["winword.exe"] = true
      l_0_11["powerpnt.exe"] = true
      l_0_11["excel.exe"] = true
      l_0_11["powershell.exe"] = true
      -- DECOMPILER ERROR at PC515: Unhandled construct in 'MakeBoolean' P1

      if l_0_11[l_0_10] == true and l_0_10 == "powershell.exe" and l_0_2 then
        return mp.INFECTED
      end
    end
    do
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

