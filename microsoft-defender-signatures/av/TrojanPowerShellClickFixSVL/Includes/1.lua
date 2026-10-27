-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanPowerShellClickFixSVL\Includes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 16 or l_0_0 > 16384 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
do
  if (string.find)((string.sub)(l_0_3, 1, 64), (string.char)(0), 1, true) then
    local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
    if not l_0_4 or type(l_0_5) ~= "string" then
      return mp.CLEAN
    end
    l_0_3 = l_0_5
  end
  if #l_0_3 < 16 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)(l_0_3)
  local l_0_7 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  for l_1_6 = 1, #l_1_1, 2 do
    local l_1_7 = {}
    local l_1_8 = 1
    local l_1_9 = 1
    while 1 do
      local l_1_10, l_1_11 = (string.find)(l_1_0, l_1_1[l_1_6], l_1_9, true)
      if l_1_10 == nil then
        break
      end
      if l_1_6 == 1 then
        l_1_7[#l_1_7 + 1] = l_1_11
      else
        while l_1_8 < #l_1_2 and l_1_2[l_1_8 + 1] < l_1_10 do
          l_1_8 = l_1_8 + 1
        end
        local l_1_12 = l_1_2[l_1_8]
        if l_1_12 < l_1_10 and l_1_10 - l_1_12 - 1 <= l_1_1[l_1_6 - 1] then
          l_1_7[#l_1_7 + 1] = l_1_11
        end
      end
      do
        l_1_9 = l_1_10 + 1
        -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
    l_1_10 = next
    l_1_11 = l_1_7
    l_1_10 = l_1_10(l_1_11)
    if l_1_10 == nil then
      l_1_10 = false
      return l_1_10
    end
    l_1_2 = l_1_7
  end
  return true
end

  local l_0_8 = {}
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC104: No list found for R7 , SetList fails

  local l_0_10 = {}
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: No list found for R8 , SetList fails

  local l_0_11 = {}
  -- DECOMPILER ERROR at PC123: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC136: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC138: No list found for R9 , SetList fails

  local l_0_12 = {}
  -- DECOMPILER ERROR at PC140: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC141: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC142: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC150: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC151: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC153: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: No list found for R10 , SetList fails

  local l_0_13 = {}
  -- DECOMPILER ERROR at PC157: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: No list found for R11 , SetList fails

  local l_0_14 = {}
  -- DECOMPILER ERROR at PC174: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC183: No list found for R12 , SetList fails

  -- DECOMPILER ERROR at PC184: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC187: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC197: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC198: Overwrote pending register: R9 in 'AssignReg'

  if l_0_10 then
    for l_0_13,l_0_14 in l_0_10 do
      -- DECOMPILER ERROR at PC201: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC202: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC203: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC207: Overwrote pending register: R7 in 'AssignReg'

      if ("in (f_*) do @if %~z")(4, "==") then
        break
      end
    end
    local l_0_15 = nil
    local l_0_16 = nil
    -- DECOMPILER ERROR at PC213: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC214: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC215: Overwrote pending register: R12 in 'AssignReg'

    local l_0_17 = nil
    local l_0_18 = 16
    local l_0_19 = "ren \""
    -- DECOMPILER ERROR at PC226: Overwrote pending register: R13 in 'AssignReg'

    local l_0_20 = 32
    local l_0_21 = ".vbs"
    -- DECOMPILER ERROR at PC236: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC237: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC238: Overwrote pending register: R17 in 'AssignReg'

    local l_0_22 = 16
    -- DECOMPILER ERROR at PC241: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC242: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC243: Overwrote pending register: R18 in 'AssignReg'

    local l_0_23 = "wscript "
    -- DECOMPILER ERROR at PC246: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC247: Overwrote pending register: R18 in 'AssignReg'

    local l_0_24 = 64
    -- DECOMPILER ERROR at PC251: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC252: Overwrote pending register: R19 in 'AssignReg'

    local l_0_25 = ".vbs"
    -- DECOMPILER ERROR at PC256: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC257: Overwrote pending register: R20 in 'AssignReg'

    local l_0_26 = ".vbs"
    -- DECOMPILER ERROR at PC261: Overwrote pending register: R20 in 'AssignReg'

    local l_0_27 = ".vbs"
    -- DECOMPILER ERROR at PC264: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC265: Overwrote pending register: R21 in 'AssignReg'

    local l_0_28 = ".vbs"
    local l_0_29 = nil
    local l_0_30 = nil
    local l_0_31 = nil
    local l_0_32 = nil
    -- DECOMPILER ERROR at PC293: Overwrote pending register: R26 in 'AssignReg'

    -- DECOMPILER ERROR at PC294: Overwrote pending register: R27 in 'AssignReg'

    l_0_30 = "https://"
    l_0_31 = 8
    l_0_32 = "-cf.com"
    local l_0_33 = nil
    -- DECOMPILER ERROR at PC300: Overwrote pending register: R27 in 'AssignReg'

    local l_0_34 = nil
    l_0_30 = "irm"
    l_0_31 = 16
    l_0_32 = "steam.run"
    l_0_33 = 16
    l_0_34 = "iex"
    local l_0_35 = nil
    l_0_31 = "$env:temp"
    l_0_32 = 255
    l_0_33 = "iwr"
    l_0_34 = 255
    l_0_35 = "volanteomaleta.cl"
    local l_0_36 = nil
    l_0_32 = "\'msxml2.xmlhttp"
    l_0_33 = 255
    l_0_34 = "iex(gc $env:tmp"
    l_0_35 = 48
    l_0_36 = "rm $env:tmp"
    local l_0_37 = nil
    l_0_33 = "irm c\"d\"n.jsdelivr.net/g\"h\"/"
    local l_0_38 = nil
    l_0_34 = "holtandberyl.com/prw"
    local l_0_39 = nil
    l_0_35 = "power!power! -nop -c iex(irm !a!!b!!c!!d!)"
    local l_0_40 = nil
    l_0_36 = "do set data=!data!!code:~%t,1!)"
    local l_0_41 = nil
    l_0_37 = "do set item=!item!!code:~%i,1!)"
    local l_0_42 = nil
    l_0_38 = "do set item=!item!!note:~%t,1!)"
    local l_0_43 = nil
    l_0_39 = "do set text=!text!!note:~%t,1!)"
    local l_0_44 = nil
    l_0_40 = "do set body=!body!!ref:~%n,1!)"
    local l_0_45 = nil
    l_0_41 = "do set text=!text!!ref:~%n,1!)"
    local l_0_46 = nil
    l_0_42 = "do set text=!text!!code:~%"
    l_0_43 = 16
    l_0_44 = ",1!)"
    local l_0_47 = nil
    l_0_43 = "%localappdata%\\"
    l_0_44 = 128
    l_0_45 = "do @if %~zf=="
    l_0_46 = 48
    l_0_47 = "copy \"%f\" %temp%\\"
    local l_0_48 = nil
    l_0_44 = "[net.servicepointmanager]::securityprotocol=[net.securityprotocoltype]::tls12;"
    l_0_45 = 255
    l_0_46 = "-usebasicparsing -outfile $env:temp\\123.ps1"
    local l_0_49 = nil
    l_0_45 = "do set item=!item!!mark:~%"
    l_0_46 = 8
    l_0_47 = ",1!)"
    l_0_48 = 16
    l_0_49 = "& set item=!item:@= !"
    local l_0_50 = nil
    l_0_46 = "start \"\" /m^i^n for /f \"delims=@\""
    l_0_47 = 16
    l_0_48 = "f^^i^^n^^g^^e^^r"
    l_0_49 = 128
    l_0_50 = "\') do "
    local l_0_51 = nil
    l_0_47 = "start \"\" /m^i^n for /f \"delims=\""
    l_0_48 = 16
    l_0_49 = "(\'where finger\') do for /f \"delims=\""
    l_0_50 = 128
    l_0_51 = "do @%"
    local l_0_52 = nil
    l_0_48 = "irm \'https://"
    l_0_49 = 255
    l_0_50 = "-useragent \'wua/"
    l_0_51 = 32
    l_0_52 = "-headers @{\'x-wua\'=\'"
    local l_0_53 = nil
    l_0_49 = "%comspec% /c start \"\""
    l_0_50 = 80
    l_0_51 = "/m^i^n for /f \"delims="
    local l_0_54 = nil
    l_0_50 = "%temp%"
    l_0_51 = 255
    l_0_52 = "https://cloubflare.net/"
    local l_0_55 = nil
    l_0_51 = "https://gfisoda.biz/"
    l_0_50, l_0_49, l_0_48, l_0_47, l_0_46, l_0_45, l_0_44, l_0_43, l_0_42, l_0_41, l_0_40, l_0_39, l_0_38, l_0_37, l_0_36, l_0_35, l_0_34, l_0_33, l_0_32, l_0_31, l_0_30, l_0_29, l_0_28, l_0_22, l_0_21, l_0_20, l_0_19, l_0_18, l_0_17, l_0_16, l_0_15 = {l_0_51}, {l_0_50, l_0_51, l_0_52}, {l_0_49, l_0_50, l_0_51}, {l_0_48, l_0_49, l_0_50, l_0_51, l_0_52}, {l_0_47, l_0_48, l_0_49, l_0_50, l_0_51}, {l_0_46, l_0_47, l_0_48, l_0_49, l_0_50}, {l_0_45, l_0_46, l_0_47, l_0_48, l_0_49}, {l_0_44, l_0_45, l_0_46}, {l_0_43, l_0_44, l_0_45, l_0_46, l_0_47, 48, "wscript", 48, ".vbs"}, {l_0_42, l_0_43, l_0_44}, {l_0_41}, {l_0_40}, {l_0_39}, {l_0_38}, {l_0_37}, {l_0_36}, {l_0_35}, {l_0_34}, {l_0_33}, {l_0_32, l_0_33, l_0_34, l_0_35, l_0_36}, {l_0_31, l_0_32, l_0_33, l_0_34, l_0_35}, {l_0_30, l_0_31, l_0_32, l_0_33, l_0_34}, {l_0_29}, {l_0_23(l_0_24)}, {l_0_22}, {l_0_21, l_0_22, l_0_23}, {l_0_20, l_0_21, l_0_22}, {l_0_19, l_0_20, l_0_21}, {l_0_18, l_0_19, l_0_20}, {l_0_17, l_0_18, l_0_19}, {l_0_16, l_0_17, l_0_18, l_0_19, l_0_20}
    -- DECOMPILER ERROR at PC416: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC434: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC435: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC443: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC444: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC448: Overwrote pending register: R9 in 'AssignReg'

    if (l_0_9 == nil or l_0_7(l_0_6, {l_0_15, l_0_16, l_0_17, l_0_18, l_0_19})) and (string.find)(l_0_6, "|powershell -w h", l_0_15, l_0_16) and (string.find)(l_0_6, "gg.ps1", l_0_15, l_0_16) then
      do
        for l_0_15,l_0_16 in ipairs({
{l_0_12, l_0_13, l_0_14}
, 
{"comspec% /c start \"\" /min for /f \"delims=@\"", 255, l_0_15}
, 
{"start \"\" /min cmd /d /v:on /q /c \"cd /d %temp%"}
, 
{l_0_15}
, l_0_15, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_22, 
{(string.lower)(l_0_25)}
, 
{(string.lower)(l_0_26)}
, 
{(string.lower)(l_0_27)}
, 
{"mshta", l_0_28, l_0_29}
, 
{l_0_28, l_0_29, l_0_30, l_0_31, l_0_32}
, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38, l_0_39, l_0_40, l_0_41, l_0_42, l_0_43, l_0_44, l_0_45, l_0_46, l_0_47, l_0_48, l_0_49, l_0_50}) do
          -- DECOMPILER ERROR at PC454: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC455: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC456: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC460: Overwrote pending register: R9 in 'AssignReg'

          if l_0_17 then
            break
          end
        end
        if l_0_9 == nil and nil == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC474: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC478: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC479: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC481: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC482: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC483: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC486: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC487: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC488: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC489: Overwrote pending register: R10 in 'AssignReg'

        -- DECOMPILER ERROR at PC490: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC493: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC494: Overwrote pending register: R16 in 'AssignReg'

        if l_0_9 == nil and not l_0_17 then
          return l_0_18
        end
        -- DECOMPILER ERROR at PC497: Confused about usage of register: R9 in 'UnsetPending'

        -- DECOMPILER ERROR at PC497: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC499: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC500: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC501: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC503: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC504: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC507: Overwrote pending register: R19 in 'AssignReg'

        -- DECOMPILER ERROR at PC509: Overwrote pending register: R20 in 'AssignReg'

        -- DECOMPILER ERROR at PC535: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC536: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC537: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC538: Overwrote pending register: R18 in 'AssignReg'

        l_0_17(l_0_18, l_0_19, l_0_20)
        -- DECOMPILER ERROR at PC540: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC541: Overwrote pending register: R15 in 'AssignReg'

        do return l_0_17 end
        -- DECOMPILER ERROR at PC543: Confused about usage of register R25 for local variables in 'ReleaseLocals'

      end
    end
  end
end

