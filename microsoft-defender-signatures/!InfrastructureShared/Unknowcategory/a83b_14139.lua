-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a83b_14139.luac 

-- params : ...
-- function num : 0
IsRmmToolFilePath = function(l_1_0)
  -- function num : 0_0
  if (string.find)(l_1_0, ":\\windows\\", 1, true) ~= nil then
    local l_1_1 = {}
    -- DECOMPILER ERROR at PC13: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC14: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC15: Overwrote pending register: R3 in 'AssignReg'

    for l_1_5,l_1_6 in ("\\pdq\\pdqdeployrunner\\")("\\action1\\") do
      if (string.find)(l_1_0, l_1_6, 1, true) ~= nil then
        return true
      end
    end
  end
  do
    l_1_1 = string
    l_1_1 = l_1_1.find
    l_1_1 = l_1_1(l_1_0, ":\\program files", 1, true)
    if l_1_1 ~= nil then
      local l_1_7 = nil
      l_1_7 = "\\anydesk\\"
      l_1_7 = "\\aweray\\awesun\\"
      l_1_7 = ipairs
      l_1_7 = l_1_7(l_1_1)
      for l_1_11,l_1_12 in l_1_7 do
        local l_1_12 = nil
        l_1_12 = string
        l_1_12 = l_1_12.find
        l_1_12 = l_1_12(l_1_0, l_1_11, 1, true)
        if l_1_12 ~= nil then
          l_1_12 = true
          return l_1_12
        end
      end
      local l_1_13 = nil
      l_1_13 = "\\anydesk[^_]+_msi\\"
      l_1_13 = ipairs
      l_1_13 = l_1_13({l_1_13, "\\intelliadmin%d*\\", "\\litemanager%s+pro%s+", "\\radmin viewer[%s%d]*\\", "\\remote utilities[%s%-]+host\\", "\\remote manipulator system[%s%-]+host\\", "\\remote manipulator system[%s%-]+viewer\\", "\\nomachine[^\\]+\\bin\\nxplayer", "\\getscreen%.me\\", "\\goverlan reach console %d+\\", "\\isl online [^%s\\]*\\isl light\\", "\\isl online[^\\]*\\isl alwayson"})
      for l_1_17,l_1_18 in l_1_13 do
        local l_1_18 = nil
        l_1_18 = string
        l_1_18 = l_1_18.find
        l_1_18 = l_1_18(l_1_0, l_1_17)
        if l_1_18 ~= nil then
          l_1_18 = true
          return l_1_18
        end
      end
    end
    do
      -- DECOMPILER ERROR at PC186: Overwrote pending register: R1 in 'AssignReg'

      -- DECOMPILER ERROR at PC187: Overwrote pending register: R1 in 'AssignReg'

      l_1_1 = l_1_1(l_1_0, ":\\programdata\\", 1, true)
      if l_1_1 ~= nil then
        local l_1_19 = nil
        for l_1_23,l_1_24 in ipairs(l_1_1) do
          local l_1_22, l_1_23, l_1_24 = nil
          l_1_22 = string
          l_1_22 = l_1_22.find
          l_1_23 = l_1_0
          l_1_24 = l_1_21
          l_1_22 = l_1_22(l_1_23, l_1_24, 1, true)
          if l_1_22 ~= nil then
            l_1_22 = true
            return l_1_22
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC225: Overwrote pending register: R1 in 'AssignReg'

        -- DECOMPILER ERROR at PC226: Overwrote pending register: R1 in 'AssignReg'

        -- DECOMPILER ERROR at PC229: Overwrote pending register: R4 in 'AssignReg'

        l_1_1 = l_1_1(l_1_0, "\\appdata\\", l_1_19, true)
        if l_1_1 ~= nil then
          local l_1_25 = nil
          for l_1_25,l_1_30 in ipairs(l_1_1) do
            local l_1_27, l_1_28, l_1_29, l_1_30 = nil
            l_1_27 = string
            l_1_27 = l_1_27.find
            l_1_28 = l_1_0
            l_1_29 = l_1_26
            l_1_30 = 1
            l_1_27 = l_1_27(l_1_28, l_1_29, l_1_30, true)
            if l_1_27 ~= nil then
              l_1_27 = true
              return l_1_27
            end
          end
          local l_1_31 = nil
          for l_1_31,l_1_36 in ipairs({"\\beamyourscreen[%s%d]*\\", "\\isl online [^%s\\]*\\isl light\\"}) do
            local l_1_33, l_1_34, l_1_35, l_1_36 = nil
            l_1_33 = string
            l_1_33 = l_1_33.find
            l_1_34 = l_1_0
            l_1_35 = l_1_32
            l_1_33 = l_1_33(l_1_34, l_1_35)
            if l_1_33 ~= nil then
              l_1_33 = true
              return l_1_33
            end
          end
        end
        do
          do
            local l_1_37 = nil
            for l_1_41,l_1_42 in ipairs(l_1_1) do
              local l_1_38, l_1_39, l_1_40, l_1_41, l_1_42 = nil
              -- DECOMPILER ERROR at PC299: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC300: Overwrote pending register: R7 in 'AssignReg'

              l_1_38 = l_1_0
              -- DECOMPILER ERROR at PC302: Confused about usage of register: R6 in 'UnsetPending'

              l_1_39 = "\\zoho-assist-desktop\\"
              l_1_40 = 1
              l_1_41 = true
              l_1_37 = l_1_37(l_1_38, l_1_39, l_1_40, l_1_41)
              if l_1_37 ~= nil then
                l_1_37 = true
                return l_1_37
              end
            end
            do return false end
            -- DECOMPILER ERROR at PC314: Confused about usage of register R6 for local variables in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

IsRmmToolVersionInfo = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = {}
  -- DECOMPILER ERROR at PC51: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC86: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC87: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC136: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC137: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC138: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: No list found for R1 , SetList fails

  local l_2_2 = {}
  -- DECOMPILER ERROR at PC142: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC146: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC149: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC150: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC151: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC153: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC154: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC183: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC187: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC188: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC189: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC190: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC192: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC193: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC194: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC197: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC198: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC199: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC200: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC202: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC203: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC204: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC205: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC206: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC207: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC208: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC209: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC210: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC211: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC212: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC213: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC214: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC215: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC216: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC217: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC218: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC219: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC220: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC221: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC222: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC223: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC224: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC225: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC226: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC227: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC228: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC229: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC230: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC231: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC232: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC233: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC234: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC235: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC236: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC237: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC238: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC239: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC240: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC241: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC242: Overwrote pending register: R52 in 'AssignReg'

  -- DECOMPILER ERROR at PC243: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC244: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC245: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC246: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC247: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC248: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC250: Overwrote pending register: R4 in 'AssignReg'

  local l_2_3 = (("atera").GetPEVersionInfo)("splashtop")
  if l_2_3 == nil then
    return false
  end
  -- DECOMPILER ERROR at PC264: Overwrote pending register: R5 in 'AssignReg'

  if l_2_3.OriginalFilename ~= nil and l_2_3.OriginalFilename ~= "" then
    local l_2_4 = (string.lower)("teamviewer")
    -- DECOMPILER ERROR at PC267: Overwrote pending register: R6 in 'AssignReg'

    for l_2_8,l_2_9 in ipairs("connectwise") do
      -- DECOMPILER ERROR at PC270: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC272: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC273: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC274: Overwrote pending register: R13 in 'AssignReg'

      if (("awesun").find)("rmm agent", "rmm webremote agent", "n-able take control", true) ~= nil then
        return true
      end
    end
    for l_2_13,l_2_14 in ipairs(l_2_2) do
      if l_2_4 == l_2_14 then
        return true
      end
    end
  else
    do
      if l_2_3.ProductName ~= nil and l_2_3.ProductName ~= "" then
        local l_2_15 = (string.lower)(l_2_3.ProductName)
        for l_2_19,l_2_20 in ipairs(l_2_1) do
          if (string.find)(l_2_15, l_2_20, 1, true) ~= nil then
            return true
          end
        end
      else
        do
          if l_2_3.FileDescription ~= nil and l_2_3.FileDescription ~= "" then
            local l_2_21 = (string.lower)(l_2_3.FileDescription)
            for l_2_25,l_2_26 in ipairs(l_2_1) do
              if (string.find)(l_2_21, l_2_26, 1, true) ~= nil then
                return true
              end
            end
            for l_2_30,l_2_31 in ipairs(l_2_2) do
              if (string.find)(l_2_21, l_2_31, 1, true) ~= nil then
                return true
              end
            end
          end
          do
            do
              do return l_2_21 end
              -- WARNING: undefined locals caused missing assignments!
            end
          end
        end
      end
    end
  end
end

IsRmmToolOFN = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = (MpCommon.GetOriginalFileName)(l_3_0)
  if l_3_1 ~= nil and l_3_1 ~= "" then
    l_3_1 = (string.lower)(l_3_1)
    local l_3_2 = nil
    l_3_2 = (string.match)(l_3_1, "%.([^%.]+)$")
    if l_3_2 == nil then
      l_3_1 = l_3_1 .. ".exe"
      l_3_2 = "exe"
    end
    if l_3_2 == "exe" then
      local l_3_3 = {}
      -- DECOMPILER ERROR at PC79: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC80: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC81: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC82: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC83: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC84: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC85: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC86: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC87: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC88: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC89: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC90: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC91: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC92: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC93: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC94: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC95: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC96: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC97: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC98: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC99: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC100: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC101: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC102: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC103: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC104: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC105: Overwrote pending register: R29 in 'AssignReg'

      -- DECOMPILER ERROR at PC106: Overwrote pending register: R30 in 'AssignReg'

      -- DECOMPILER ERROR at PC107: Overwrote pending register: R31 in 'AssignReg'

      -- DECOMPILER ERROR at PC108: Overwrote pending register: R32 in 'AssignReg'

      -- DECOMPILER ERROR at PC109: Overwrote pending register: R33 in 'AssignReg'

      -- DECOMPILER ERROR at PC110: Overwrote pending register: R34 in 'AssignReg'

      -- DECOMPILER ERROR at PC111: Overwrote pending register: R35 in 'AssignReg'

      -- DECOMPILER ERROR at PC112: Overwrote pending register: R36 in 'AssignReg'

      -- DECOMPILER ERROR at PC113: Overwrote pending register: R37 in 'AssignReg'

      -- DECOMPILER ERROR at PC114: Overwrote pending register: R38 in 'AssignReg'

      -- DECOMPILER ERROR at PC115: Overwrote pending register: R39 in 'AssignReg'

      -- DECOMPILER ERROR at PC116: Overwrote pending register: R40 in 'AssignReg'

      -- DECOMPILER ERROR at PC117: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC118: Overwrote pending register: R42 in 'AssignReg'

      -- DECOMPILER ERROR at PC119: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC120: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC121: Overwrote pending register: R45 in 'AssignReg'

      -- DECOMPILER ERROR at PC122: Overwrote pending register: R46 in 'AssignReg'

      -- DECOMPILER ERROR at PC123: Overwrote pending register: R47 in 'AssignReg'

      -- DECOMPILER ERROR at PC124: Overwrote pending register: R48 in 'AssignReg'

      -- DECOMPILER ERROR at PC125: Overwrote pending register: R49 in 'AssignReg'

      -- DECOMPILER ERROR at PC126: Overwrote pending register: R50 in 'AssignReg'

      -- DECOMPILER ERROR at PC127: Overwrote pending register: R51 in 'AssignReg'

      -- DECOMPILER ERROR at PC128: Overwrote pending register: R52 in 'AssignReg'

      -- DECOMPILER ERROR at PC129: Overwrote pending register: R53 in 'AssignReg'

      -- DECOMPILER ERROR at PC130: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC131: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC132: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC133: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC134: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC135: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC136: Overwrote pending register: R5 in 'AssignReg'

      for l_3_7,l_3_8 in ("tv_w32.exe")("tv_x64.exe") do
        if l_3_1 == l_3_8 then
          return true
        end
      end
    end
  end
  do
    do
      do return l_3_2 end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end


