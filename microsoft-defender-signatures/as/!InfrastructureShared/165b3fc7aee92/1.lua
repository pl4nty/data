-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\165b3fc7aee92\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
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
-- DECOMPILER ERROR at PC54: No list found for R4 , SetList fails

local l_0_5 = {}
-- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC59: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("\\windows defender\\")("\\microsoft monitoring agent\\") do
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

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
    l_0_16 = true
    l_0_18 = "encoded_ps"
    local l_0_19 = (string.match)(l_0_1, "%-e[ncodmma]*%s+([A-Za-z0-9+/=]+)%s*$")
    if l_0_19 and #l_0_19 > 20 then
      local l_0_20, l_0_21 = pcall(MpCommon.Base64Decode, l_0_19)
      if l_0_20 and l_0_21 then
        local l_0_22, l_0_23 = pcall(mp.utf16to8, l_0_21)
        if l_0_22 and l_0_23 then
          local l_0_24 = (string.lower)(l_0_23)
          local l_0_25 = {}
          -- DECOMPILER ERROR at PC198: No list found for R15 , SetList fails

          -- DECOMPILER ERROR at PC199: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC200: Overwrote pending register: R17 in 'AssignReg'

          for l_0_29,l_0_30 in ("get-wmiobject win32_volume")("get-wmiobject win32_logicaldisk") do
            -- DECOMPILER ERROR at PC203: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC205: Overwrote pending register: R22 in 'AssignReg'

            -- DECOMPILER ERROR at PC206: Overwrote pending register: R23 in 'AssignReg'

            -- DECOMPILER ERROR at PC207: Overwrote pending register: R24 in 'AssignReg'

            if (("win32_operatingsystem").find)("win32_computersystem", "get-service", "get-process", true) then
              break
            end
          end
        end
      end
    end
  else
    do
      do
        -- DECOMPILER ERROR at PC227: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC228: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC284: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC285: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC315: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC316: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC345: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC346: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC347: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC367: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC368: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC369: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC399: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC400: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC401: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC421: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC422: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC423: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC434: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC435: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC436: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC465: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC466: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC467: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC505: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC506: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC507: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC554: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC555: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC556: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC586: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC587: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC588: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC608: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC609: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC610: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC657: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC658: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC659: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC680: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC681: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC682: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC702: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC703: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC704: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC742: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC743: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC744: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC773: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC774: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC775: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC796: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC797: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC798: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC827: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC828: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC829: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC858: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC859: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC860: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC865: Unhandled construct in 'MakeBoolean' P3

        if ((((((((not (string.find)(l_0_1, "frombase64string", 1, true) or not (string.find)(l_0_1, "downloadstring", 1, true)) and not (string.find)(l_0_1, "invoke-restmethod", 1, true)) or not (string.find)(l_0_1, "invoke-expression", 1, true)) and not (string.find)(l_0_1, "iex (", 1, true)) or not (string.find)(l_0_1, "amsiutils", 1, true)) and not (string.find)(l_0_1, "amsicontext", 1, true)) or (string.find)(l_0_1, "set-mppreference", 1, true)) and l_0_16) or ((((((((((string.find)(l_0_1, "-urlcache", 1, true) or (string.find)(l_0_1, "-decode", 1, true)) and not (string.find)(l_0_3, "\\bitsadmin.exe", 1, true)) or (string.find)(l_0_3, "\\mshta.exe", 1, true)) and not (string.find)(l_0_3, "\\regsvr32.exe", 1, true)) or (string.find)(l_0_1, "/i:", 1, true) or (string.find)(l_0_3, "\\rundll32.exe", 1, true)) and not (string.find)(l_0_1, "javascript:", 1, true) and (string.find)(l_0_3, "\\wscript.exe", 1, true)) or (string.find)(l_0_3, "\\cscript.exe", 1, true)) and not (string.find)(l_0_1, "\\temp\\", 1, true) and not (string.find)(l_0_1, "\\appdata\\", 1, true) and l_0_16) or ((((((not (string.find)(l_0_1, "ifm", 1, true) and not (string.find)(l_0_1, "ac i ntds", 1, true)) or not (string.find)(l_0_1, "sekurlsa", 1, true)) and not (string.find)(l_0_1, "lsadump", 1, true)) or (string.find)(l_0_3, "\\reg.exe", 1, true)) and not (string.find)(l_0_1, " sam", 1, true) and not (string.find)(l_0_1, " security", 1, true) and l_0_16) or ((((not (string.find)(l_0_1, "\\run", 1, true) and not (string.find)(l_0_1, "\\runonce", 1, true)) or (string.find)(l_0_3, "\\net.exe", 1, true)) and l_0_16) or ((((string.find)(l_0_1, " cl ", 1, true) or (string.find)(l_0_1, "clear-log", 1, true)) and not (string.find)(l_0_3, "\\bcdedit.exe", 1, true)) or not l_0_16)))) then
          return mp.CLEAN
        end
        ;
        (bm.add_related_string)("WinRM_reason", l_0_18, bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("WinRM_cmd", l_0_1, bm.RelatedStringBMReport)
        ;
        (bm.add_related_string)("WinRM_img", l_0_3, bm.RelatedStringBMReport)
        TrackPidAndTechniqueBM("BM", l_0_17, "SuspWinRMChild")
        add_parents()
        do return mp.INFECTED end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

