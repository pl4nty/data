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
  local l_0_7 = ""
  if (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
    l_0_7 = ClassifyClickFixExecution(l_0_3, false)
    if l_0_7 == "lowfi" then
      (mp.set_mpattribute)("Lua:ClickFixExecSA")
    end
  end
  local l_0_8 = function(l_1_0, l_1_1)
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

  local l_0_9 = {}
  local l_0_10 = {}
  -- DECOMPILER ERROR at PC122: No list found for R8 , SetList fails

  local l_0_11 = {}
  -- DECOMPILER ERROR at PC124: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: No list found for R9 , SetList fails

  local l_0_12 = {}
  -- DECOMPILER ERROR at PC141: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC142: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC150: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC151: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC153: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC154: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: No list found for R10 , SetList fails

  local l_0_13 = {}
  -- DECOMPILER ERROR at PC158: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: No list found for R11 , SetList fails

  local l_0_14 = {}
  -- DECOMPILER ERROR at PC175: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC183: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC187: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC188: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC190: No list found for R12 , SetList fails

  local l_0_15 = {}
  -- DECOMPILER ERROR at PC192: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC193: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC194: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC197: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC198: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC199: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC200: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: No list found for R13 , SetList fails

  -- DECOMPILER ERROR at PC202: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC206: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC209: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC217: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC219: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC220: Overwrote pending register: R10 in 'AssignReg'

  if l_0_7 ~= "block" or l_0_11 then
    for l_0_14,l_0_15 in l_0_11 do
      -- DECOMPILER ERROR at PC223: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC224: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC225: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC229: Overwrote pending register: R8 in 'AssignReg'

      if ("in (f_*) do @if %~z")(4, "==") then
        break
      end
    end
    local l_0_16 = nil
    local l_0_17 = nil
    -- DECOMPILER ERROR at PC235: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC236: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC237: Overwrote pending register: R13 in 'AssignReg'

    local l_0_18 = nil
    local l_0_19 = 16
    local l_0_20 = "ren \""
    -- DECOMPILER ERROR at PC248: Overwrote pending register: R14 in 'AssignReg'

    local l_0_21 = 32
    local l_0_22 = ".vbs"
    -- DECOMPILER ERROR at PC258: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC259: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC260: Overwrote pending register: R18 in 'AssignReg'

    local l_0_23 = 16
    -- DECOMPILER ERROR at PC263: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC264: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC265: Overwrote pending register: R19 in 'AssignReg'

    local l_0_24 = "wscript "
    -- DECOMPILER ERROR at PC268: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC269: Overwrote pending register: R19 in 'AssignReg'

    local l_0_25 = 64
    -- DECOMPILER ERROR at PC273: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC274: Overwrote pending register: R20 in 'AssignReg'

    local l_0_26 = ".vbs"
    -- DECOMPILER ERROR at PC278: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC279: Overwrote pending register: R21 in 'AssignReg'

    local l_0_27 = ".vbs"
    -- DECOMPILER ERROR at PC283: Overwrote pending register: R21 in 'AssignReg'

    local l_0_28 = ".vbs"
    -- DECOMPILER ERROR at PC286: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC287: Overwrote pending register: R22 in 'AssignReg'

    local l_0_29 = ".vbs"
    local l_0_30 = nil
    local l_0_31 = nil
    local l_0_32 = nil
    local l_0_33 = nil
    -- DECOMPILER ERROR at PC315: Overwrote pending register: R27 in 'AssignReg'

    -- DECOMPILER ERROR at PC316: Overwrote pending register: R28 in 'AssignReg'

    l_0_31 = "https://"
    l_0_32 = 8
    l_0_33 = "-cf.com"
    local l_0_34 = nil
    -- DECOMPILER ERROR at PC322: Overwrote pending register: R28 in 'AssignReg'

    local l_0_35 = nil
    l_0_31 = "irm"
    l_0_32 = 16
    l_0_33 = "steam.run"
    l_0_34 = 16
    l_0_35 = "iex"
    local l_0_36 = nil
    l_0_32 = "$env:temp"
    l_0_33 = 255
    l_0_34 = "iwr"
    l_0_35 = 255
    l_0_36 = "volanteomaleta.cl"
    local l_0_37 = nil
    l_0_33 = "\'msxml2.xmlhttp"
    l_0_34 = 255
    l_0_35 = "iex(gc $env:tmp"
    l_0_36 = 48
    l_0_37 = "rm $env:tmp"
    local l_0_38 = nil
    l_0_34 = "irm c\"d\"n.jsdelivr.net/g\"h\"/"
    local l_0_39 = nil
    l_0_35 = "holtandberyl.com/prw"
    local l_0_40 = nil
    l_0_36 = "power!power! -nop -c iex(irm !a!!b!!c!!d!)"
    local l_0_41 = nil
    l_0_37 = "do set data=!data!!code:~%t,1!)"
    local l_0_42 = nil
    l_0_38 = "do set item=!item!!code:~%i,1!)"
    local l_0_43 = nil
    l_0_39 = "do set item=!item!!note:~%t,1!)"
    local l_0_44 = nil
    l_0_40 = "do set text=!text!!note:~%t,1!)"
    local l_0_45 = nil
    l_0_41 = "do set body=!body!!ref:~%n,1!)"
    local l_0_46 = nil
    l_0_42 = "do set text=!text!!ref:~%n,1!)"
    local l_0_47 = nil
    l_0_43 = "do set text=!text!!code:~%"
    l_0_44 = 16
    l_0_45 = ",1!)"
    local l_0_48 = nil
    l_0_44 = "%localappdata%\\"
    l_0_45 = 128
    l_0_46 = "do @if %~zf=="
    l_0_47 = 48
    l_0_48 = "copy \"%f\" %temp%\\"
    local l_0_49 = nil
    l_0_45 = "[net.servicepointmanager]::securityprotocol=[net.securityprotocoltype]::tls12;"
    l_0_46 = 255
    l_0_47 = "-usebasicparsing -outfile $env:temp\\123.ps1"
    local l_0_50 = nil
    l_0_46 = "do set item=!item!!mark:~%"
    l_0_47 = 8
    l_0_48 = ",1!)"
    l_0_49 = 16
    l_0_50 = "& set item=!item:@= !"
    local l_0_51 = nil
    l_0_47 = "start \"\" /m^i^n for /f \"delims=@\""
    l_0_48 = 16
    l_0_49 = "f^^i^^n^^g^^e^^r"
    l_0_50 = 128
    l_0_51 = "\') do "
    local l_0_52 = nil
    l_0_48 = "start \"\" /m^i^n for /f \"delims=\""
    l_0_49 = 16
    l_0_50 = "(\'where finger\') do for /f \"delims=\""
    l_0_51 = 128
    l_0_52 = "do @%"
    local l_0_53 = nil
    l_0_49 = "irm \'https://"
    l_0_50 = 255
    l_0_51 = "-useragent \'wua/"
    l_0_52 = 32
    l_0_53 = "-headers @{\'x-wua\'=\'"
    local l_0_54 = nil
    l_0_50 = "%comspec% /c start \"\""
    l_0_51 = 80
    l_0_52 = "/m^i^n for /f \"delims="
    local l_0_55 = nil
    l_0_51 = "%temp%"
    l_0_52 = 255
    l_0_53 = "https://cloubflare.net/"
    local l_0_56 = nil
    l_0_52 = "https://gfisoda.biz/"
    l_0_51, l_0_50, l_0_49, l_0_48, l_0_47, l_0_46, l_0_45, l_0_44, l_0_43, l_0_42, l_0_41, l_0_40, l_0_39, l_0_38, l_0_37, l_0_36, l_0_35, l_0_34, l_0_33, l_0_32, l_0_31, l_0_30, l_0_29, l_0_23, l_0_22, l_0_21, l_0_20, l_0_19, l_0_18, l_0_17, l_0_16 = {l_0_52}, {l_0_51, l_0_52, l_0_53}, {l_0_50, l_0_51, l_0_52}, {l_0_49, l_0_50, l_0_51, l_0_52, l_0_53}, {l_0_48, l_0_49, l_0_50, l_0_51, l_0_52}, {l_0_47, l_0_48, l_0_49, l_0_50, l_0_51}, {l_0_46, l_0_47, l_0_48, l_0_49, l_0_50}, {l_0_45, l_0_46, l_0_47}, {l_0_44, l_0_45, l_0_46, l_0_47, l_0_48, 48, "wscript", 48, ".vbs"}, {l_0_43, l_0_44, l_0_45}, {l_0_42}, {l_0_41}, {l_0_40}, {l_0_39}, {l_0_38}, {l_0_37}, {l_0_36}, {l_0_35}, {l_0_34}, {l_0_33, l_0_34, l_0_35, l_0_36, l_0_37}, {l_0_32, l_0_33, l_0_34, l_0_35, l_0_36}, {l_0_31, l_0_32, l_0_33, l_0_34, l_0_35}, {l_0_30}, {l_0_24(l_0_25)}, {l_0_23}, {l_0_22, l_0_23, l_0_24}, {l_0_21, l_0_22, l_0_23}, {l_0_20, l_0_21, l_0_22}, {l_0_19, l_0_20, l_0_21}, {l_0_18, l_0_19, l_0_20}, {l_0_17, l_0_18, l_0_19, l_0_20, l_0_21}
    -- DECOMPILER ERROR at PC438: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC456: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC457: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC465: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC466: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC470: Overwrote pending register: R10 in 'AssignReg'

    if (l_0_10 == nil or l_0_8(l_0_6, {l_0_16, l_0_17, l_0_18, l_0_19, l_0_20})) and (string.find)(l_0_6, "|powershell -w h", l_0_16, l_0_17) and (string.find)(l_0_6, "gg.ps1", l_0_16, l_0_17) then
      do
        for l_0_16,l_0_17 in ipairs({
{l_0_13, l_0_14, l_0_15}
, 
{"comspec% /c start \"\" /min for /f \"delims=@\"", 255, l_0_16}
, 
{"start \"\" /min cmd /d /v:on /q /c \"cd /d %temp%"}
, 
{l_0_16}
, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_22, l_0_23, 
{(string.lower)(l_0_26)}
, 
{(string.lower)(l_0_27)}
, 
{(string.lower)(l_0_28)}
, 
{"mshta", l_0_29, l_0_30}
, 
{l_0_29, l_0_30, l_0_31, l_0_32, l_0_33}
, l_0_29, l_0_30, l_0_31, l_0_32, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38, l_0_39, l_0_40, l_0_41, l_0_42, l_0_43, l_0_44, l_0_45, l_0_46, l_0_47, l_0_48, l_0_49, l_0_50, l_0_51}) do
          -- DECOMPILER ERROR at PC476: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC477: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC478: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC482: Overwrote pending register: R10 in 'AssignReg'

          if l_0_18 then
            break
          end
        end
        if l_0_10 == nil and nil == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC496: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC500: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC501: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC503: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC504: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC505: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC508: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC509: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC510: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC511: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC512: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC515: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC516: Overwrote pending register: R17 in 'AssignReg'

        if l_0_10 == nil and not l_0_18 then
          return l_0_19
        end
        -- DECOMPILER ERROR at PC519: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC519: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC521: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC522: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC523: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC525: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC526: Overwrote pending register: R19 in 'AssignReg'

        -- DECOMPILER ERROR at PC529: Overwrote pending register: R20 in 'AssignReg'

        -- DECOMPILER ERROR at PC531: Overwrote pending register: R21 in 'AssignReg'

        -- DECOMPILER ERROR at PC557: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC558: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC559: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC560: Overwrote pending register: R19 in 'AssignReg'

        l_0_18(l_0_19, l_0_20, l_0_21)
        -- DECOMPILER ERROR at PC562: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC563: Overwrote pending register: R16 in 'AssignReg'

        do return l_0_18 end
        -- DECOMPILER ERROR at PC565: Confused about usage of register R26 for local variables in 'ReleaseLocals'

      end
    end
  end
end

