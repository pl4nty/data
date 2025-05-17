-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\272948832469\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetBruteMatchData)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = (string.lower)(tostring(headerpage))
else
  l_0_1 = (string.lower)(tostring(footerpage))
end
if l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC44: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

local l_0_3 = ((":\\saw\\system\\sawhealthcheck.ps1$").getfilename)()
-- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

if l_0_3 and l_0_3 and contains((string.lower)(":\\windows\\imecache\\healthscripts\\.+%.ps1$"), l_0_2, false) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
-- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

if l_0_5 and contains((string.lower)(":\\agent\\enableagent.ps1$"), l_0_2, false) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC100: Overwrote pending register: R10 in 'AssignReg'

local l_0_6, l_0_7 = (MpCommon.StringRegExpSearch)("((?:set|add)-mppreference\\s+-exclusion.+?(?:;|\\||<|>|$))", l_0_1:sub(":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$" - 3))
if l_0_6 then
  local l_0_8 = 1
  local l_0_9 = ""
  local l_0_10 = (mp.getfilename)()
  -- DECOMPILER ERROR at PC111: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R13 in 'AssignReg'

  l_0_10 = ((":\\work\\cloudtest\\preconfig.cmd$")("%w\\bin\\defender%-exclusions.ps1$", ":\\packages\\plugins\\microsoft.", "")):lower()
  for l_0_14,l_0_15 in (l_0_7:gsub("-exclusion", ";")):gmatch("(%w+)%s+([^;]+)") do
    if l_0_15:sub(1, 2) == "@(" then
      l_0_15 = l_0_15:match("^@%((.-)%)")
    end
    for l_0_19 in (string.gmatch)(l_0_15, "([^,]+)") do
      l_0_19 = l_0_19:match("^%s*(.-)%s*$")
      if l_0_19:sub(1, 1) == "\'" or l_0_19:sub(1, 1) == "\"" then
        l_0_19 = l_0_19:match("^[\'\"](.-)[\'\"]")
      else
        l_0_19 = l_0_19:match("^%S+")
      end
      if l_0_19:sub(1, 5) == "$env:" then
        l_0_19 = "%" .. l_0_19:sub(6) .. "%"
      end
      local l_0_20 = l_0_14 .. "|" .. l_0_19
      local l_0_21 = "(%systemdrive%)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(c:(\\\\*)?\\*?%?$)"
      local l_0_22, l_0_23 = (MpCommon.StringRegExpSearch)(l_0_21, l_0_20)
      if l_0_22 then
        l_0_8 = l_0_8 + 20
        l_0_9 = l_0_9 .. ";" .. l_0_20
      else
        l_0_21 = "(%userprofile%|%programdata%|%appdata%|%localappdata%|%windir%|%programfiles(x86)%|%programfiles%)$|(c:\\\\users\\\\.*\\\\(documents|downloads|pictures|music|videos))$|(\\w:(\\\\*)?\\*?%?$)"
        l_0_22 = (MpCommon.StringRegExpSearch)(l_0_21, l_0_20)
        if l_0_22 then
          l_0_8 = l_0_8 + 10
          l_0_9 = l_0_9 .. ";" .. l_0_20
        end
      end
    end
  end
  local l_0_24 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  local l_0_25 = {}
  if l_0_24 then
    local l_0_26 = (mp.GetProcessCommandLine)(l_0_24)
    if l_0_26 then
      do
        if not (mp.GetExecutablesFromCommandLine)(l_0_26) then
          local l_0_27 = {}
        end
        local l_0_28 = nil
        if (mp.GetParentProcInfo)(l_0_24) and ((mp.GetParentProcInfo)(l_0_24)).ppid then
          local l_0_29 = nil
          if (mp.GetProcessCommandLine)(((mp.GetParentProcInfo)(l_0_24)).ppid) then
            do
              do
                if not (mp.GetExecutablesFromCommandLine)((mp.GetProcessCommandLine)(((mp.GetParentProcInfo)(l_0_24)).ppid)) then
                  local l_0_30 = nil
                end
                l_0_28 = table_dedup(table_merge(l_0_28, {}))
                local l_0_31 = MpCommon.BmTriggerSig
                local l_0_32 = l_0_24
                local l_0_33 = "WDAVExclusion"
                do
                  do
                    l_0_31(l_0_32, l_0_33, l_0_10 or l_0_5)
                    if l_0_8 >= 20 then
                      l_0_31 = mp
                      l_0_31 = l_0_31.get_mpattribute
                      l_0_32 = "MpIsPowerShellAMSIScan"
                      l_0_31 = l_0_31(l_0_32)
                      if l_0_31 then
                        l_0_31 = set_research_data
                        l_0_32 = "BadExclusions"
                        l_0_33 = MpCommon
                        l_0_33 = l_0_33.Base64Encode
                        l_0_33 = l_0_33(l_0_9)
                        l_0_31(l_0_32, l_0_33, false)
                        l_0_31 = set_research_data
                        l_0_32 = "ParentsInfo"
                        l_0_33 = MpCommon
                        l_0_33 = l_0_33.Base64Encode
                        l_0_33 = l_0_33(safeJsonSerialize(l_0_25))
                        l_0_31(l_0_32, l_0_33, false)
                        l_0_31 = hasSeenBefore
                        l_0_32 = "ALF:Trojan:Win32/WDAVExclusion.B"
                        l_0_33 = ""
                        l_0_31 = l_0_31(l_0_32, l_0_33, 1, "SignatureHitInMachine")
                        if l_0_31 and l_0_32 > 5 then
                          l_0_33 = mp
                          l_0_33 = l_0_33.CLEAN
                          return l_0_33
                        end
                        l_0_33 = addDisruptionInfo
                        l_0_33(true)
                        l_0_33 = mp
                        l_0_33 = l_0_33.INFECTED
                        return l_0_33
                      end
                    end
                    do return mp.CLEAN end
                    -- DECOMPILER ERROR at PC324: freeLocal<0 in 'ReleaseLocals'

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

