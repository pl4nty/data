-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10eb39656049a\1.luac 

-- params : ...
-- function num : 0
if (((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))) then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = {}
-- DECOMPILER ERROR at PC91: No list found for R4 , SetList fails

local l_0_5 = {}
-- DECOMPILER ERROR at PC93: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC96: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC97: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC98: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("\\windows defender\\")("\\microsoft monitoring agent\\") do
  -- DECOMPILER ERROR at PC101: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R14 in 'AssignReg'

  if (("\\saltstack\\").find)("\\sccm\\", "\\ccm\\", "\\dsc\\", true) then
    return mp.CLEAN
  end
end
for l_0_14,l_0_15 in ipairs(l_0_5) do
  if (string.find)(l_0_1, l_0_15, 1, true) then
    return mp.CLEAN
  end
end
local l_0_16 = false
local l_0_17 = "T1021.006"
local l_0_18 = ""
if (string.find)(l_0_3, "powershell", 1, true) or (string.find)(l_0_3, "pwsh", 1, true) then
  if (string.find)(l_0_1, "-encodedcommand", 1, true) or (string.find)(l_0_1, " -enc ", 1, true) or (string.find)(l_0_1, " -e ", 1, true) and (string.find)(l_0_1, "[A-Za-z0-9+/=]%s*$") then
    local l_0_19 = (string.match)(l_0_1, "%-e%a*%s+([A-Za-z0-9+/=]+)%s*$")
    if l_0_19 and #l_0_19 > 20 then
      local l_0_20, l_0_21 = pcall(MpCommon.Base64Decode, l_0_19)
      if l_0_20 and l_0_21 then
        local l_0_22, l_0_23 = pcall(mp.utf16to8, l_0_21)
        if l_0_22 and l_0_23 then
          local l_0_24 = (string.lower)(l_0_23)
          local l_0_25 = {}
          -- DECOMPILER ERROR at PC260: No list found for R15 , SetList fails

          -- DECOMPILER ERROR at PC261: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC262: Overwrote pending register: R17 in 'AssignReg'

          for l_0_29,l_0_30 in ("invoke-mimikatz")("sekurlsa") do
            -- DECOMPILER ERROR at PC265: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC267: Overwrote pending register: R22 in 'AssignReg'

            -- DECOMPILER ERROR at PC268: Overwrote pending register: R23 in 'AssignReg'

            -- DECOMPILER ERROR at PC269: Overwrote pending register: R24 in 'AssignReg'

            if (("sharphound").find)("rubeus", "safetykatz", "sharpkatz", true) then
              break
            end
          end
        end
      else
        do
          do
            do
              -- DECOMPILER ERROR at PC283: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC284: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC295: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC296: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC352: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC353: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC382: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC383: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC412: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC413: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC442: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC443: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC444: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC464: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC465: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC466: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC496: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC497: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC498: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC518: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC519: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC520: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC531: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC532: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC533: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC562: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC563: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC564: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC602: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC603: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC604: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC651: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC652: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC653: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC683: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC684: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC685: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC705: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC706: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC707: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC754: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC755: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC756: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC777: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC778: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC779: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC799: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC800: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC801: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC839: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC840: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC841: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC870: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC871: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC872: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC893: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC894: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC895: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC924: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC925: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC926: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC955: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC956: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC957: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC962: Unhandled construct in 'MakeBoolean' P3

              if #l_0_19 <= 500 or (((((not (string.find)(l_0_1, "frombase64string", 1, true) or not (string.find)(l_0_1, "downloadstring", 1, true)) and not (string.find)(l_0_1, "invoke-restmethod", 1, true)) or (string.find)(l_0_1, "169.254.169.254", 1, true) or (string.find)(l_0_1, "metadata.google", 1, true) or (string.find)(l_0_1, "metadata.azure", 1, true)) and not (string.find)(l_0_1, "invoke-expression", 1, true) and not (string.find)(l_0_1, "iex(", 1, true) and (string.find)(l_0_1, "iex (", 1, true) and not (string.find)(l_0_1, "amsiutils", 1, true) and not (string.find)(l_0_1, "amsiinitfailed", 1, true) and (string.find)(l_0_1, "amsicontext", 1, true) and l_0_16) or ((((((((((string.find)(l_0_1, "-urlcache", 1, true) or (string.find)(l_0_1, "-decode", 1, true)) and not (string.find)(l_0_3, "\\bitsadmin.exe", 1, true)) or (string.find)(l_0_3, "\\mshta.exe", 1, true)) and not (string.find)(l_0_3, "\\regsvr32.exe", 1, true)) or (string.find)(l_0_1, "/i:", 1, true) or (string.find)(l_0_3, "\\rundll32.exe", 1, true)) and not (string.find)(l_0_1, "javascript:", 1, true) and (string.find)(l_0_3, "\\wscript.exe", 1, true)) or (string.find)(l_0_3, "\\cscript.exe", 1, true)) and not (string.find)(l_0_1, "\\temp\\", 1, true) and not (string.find)(l_0_1, "\\appdata\\", 1, true) and l_0_16) or ((((((not (string.find)(l_0_1, "ifm", 1, true) and not (string.find)(l_0_1, "ac i ntds", 1, true)) or not (string.find)(l_0_1, "sekurlsa", 1, true)) and not (string.find)(l_0_1, "lsadump", 1, true)) or (string.find)(l_0_3, "\\reg.exe", 1, true)) and not (string.find)(l_0_1, " sam", 1, true) and not (string.find)(l_0_1, " security", 1, true) and l_0_16) or ((((not (string.find)(l_0_1, "\\run", 1, true) and not (string.find)(l_0_1, "\\runonce", 1, true)) or (string.find)(l_0_3, "\\net.exe", 1, true)) and l_0_16) or ((((string.find)(l_0_1, " cl ", 1, true) or (string.find)(l_0_1, "clear-log", 1, true)) and not (string.find)(l_0_3, "\\bcdedit.exe", 1, true)) or not l_0_16))))) then
                return mp.CLEAN
              end
              ;
              (bm.add_related_string)("WinRM_reason", l_0_18, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("WinRM_cmd", l_0_1, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("WinRM_img", l_0_3, bm.RelatedStringBMReport)
              TrackPidAndTechniqueBM("BM", l_0_17, "WinRMChild")
              add_parents()
              do return mp.INFECTED end
              -- WARNING: undefined locals caused missing assignments!
            end
          end
        end
      end
    end
  end
end

