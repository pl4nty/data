-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 == 0 or l_0_0 > 700 then
  return mp.CLEAN
end
do
  if not tostring(headerpage) then
    local l_0_1, l_0_2 = tostring(footerpage)
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil or #l_0_1 == 0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = (mp.utf16to8)(l_0_1)
  if #l_0_3 > 512 then
    return mp.CLEAN
  end
  local l_0_4 = (string.lower)(l_0_3)
  local l_0_5 = false
  local l_0_6 = nil
  local l_0_7, l_0_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_7 and type(l_0_8) == "string" and #l_0_8 > 0 then
    l_0_6 = l_0_8
    local l_0_9 = (string.lower)(l_0_8)
    if (string.sub)(l_0_9, 1, 7) == "http://" or (string.sub)(l_0_9, 1, 8) == "https://" then
      l_0_5 = true
    end
  end
  do
    local l_0_10 = {}
    -- DECOMPILER ERROR at PC108: No list found for R7 , SetList fails

    local l_0_11 = {}
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

    -- DECOMPILER ERROR at PC123: No list found for R8 , SetList fails

    local l_0_12 = {}
    -- DECOMPILER ERROR at PC125: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC126: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC127: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC128: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC129: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC130: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC131: No list found for R9 , SetList fails

    -- DECOMPILER ERROR at PC132: Overwrote pending register: R10 in 'AssignReg'

    local l_0_13 = "regsvr32"
    -- DECOMPILER ERROR at PC133: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC134: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC135: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC147: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC155: Overwrote pending register: R10 in 'AssignReg'

    if ((not ("regsvr32.exe")("certutil", "certutil.exe") or contains(l_0_4, l_0_11)) and not contains(l_0_4, l_0_12)) or l_0_13 == 0 then
      return mp.CLEAN
    end
    local l_0_14 = {}
    -- DECOMPILER ERROR at PC164: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC165: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC166: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC167: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC168: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC169: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC170: Overwrote pending register: R20 in 'AssignReg'

    -- DECOMPILER ERROR at PC171: Overwrote pending register: R21 in 'AssignReg'

    -- DECOMPILER ERROR at PC172: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC173: Overwrote pending register: R23 in 'AssignReg'

    -- DECOMPILER ERROR at PC174: Overwrote pending register: R24 in 'AssignReg'

    -- DECOMPILER ERROR at PC175: Overwrote pending register: R25 in 'AssignReg'

    -- DECOMPILER ERROR at PC176: Overwrote pending register: R26 in 'AssignReg'

    -- DECOMPILER ERROR at PC177: Overwrote pending register: R27 in 'AssignReg'

    -- DECOMPILER ERROR at PC178: Overwrote pending register: R28 in 'AssignReg'

    -- DECOMPILER ERROR at PC179: Overwrote pending register: R29 in 'AssignReg'

    -- DECOMPILER ERROR at PC180: Overwrote pending register: R30 in 'AssignReg'

    -- DECOMPILER ERROR at PC181: Overwrote pending register: R31 in 'AssignReg'

    -- DECOMPILER ERROR at PC204: No list found for R11 , SetList fails

    -- DECOMPILER ERROR at PC205: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC206: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC207: Overwrote pending register: R14 in 'AssignReg'

    do
      if not l_0_5 or not "|REMOTE" then
        local l_0_15, l_0_16 = not ("invoke-expression")(" iex ", "bitsadmin") or ""
      end
      local l_0_17 = nil
      local l_0_18 = set_research_data
      -- DECOMPILER ERROR at PC219: Overwrote pending register: R15 in 'AssignReg'

      local l_0_19 = "ClickFixRDia_SC"
      -- DECOMPILER ERROR at PC220: Overwrote pending register: R16 in 'AssignReg'

      local l_0_20 = "bitsadmin.exe"
      -- DECOMPILER ERROR at PC221: Overwrote pending register: R17 in 'AssignReg'

      local l_0_21 = "curl.exe"
      -- DECOMPILER ERROR at PC222: Overwrote pending register: R18 in 'AssignReg'

      local l_0_22 = "wmic"
      -- DECOMPILER ERROR at PC223: Overwrote pending register: R19 in 'AssignReg'

      local l_0_23 = "wmic.exe"
      -- DECOMPILER ERROR at PC224: Overwrote pending register: R20 in 'AssignReg'

      local l_0_24 = "installutil"
      do
        -- DECOMPILER ERROR at PC230: Overwrote pending register: R22 in 'AssignReg'

        -- DECOMPILER ERROR at PC231: Overwrote pending register: R23 in 'AssignReg'

        l_0_18(l_0_19, l_0_20, l_0_21)
        -- DECOMPILER ERROR at PC237: Overwrote pending register: R13 in 'AssignReg'

        do return l_0_18 end
        local l_0_26 = nil
        -- DECOMPILER ERROR at PC240: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC242: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC243: Overwrote pending register: R16 in 'AssignReg'

        local l_0_27 = {l_0_18, "-noninteractive", l_0_20, l_0_21, "-wi h", "-wi 1", "-executionpolicy", "-useb", "-usebasicparsing", "start-process"}
        for l_0_31,l_0_32 in ipairs(l_0_27) do
          local l_0_28 = 0
          -- DECOMPILER ERROR at PC259: Confused about usage of register: R18 in 'UnsetPending'

        end
        do
          -- DECOMPILER ERROR at PC300: Unhandled construct in 'MakeBoolean' P3

          if ((not (string.find)(l_0_4, "-wi 1", 1, true) or not (string.find)(l_0_4, "http://", 1, true)) and not (string.find)(l_0_4, "ftp://", 1, true)) or l_0_5 then
            local l_0_33 = l_0_28 + 1 + 2
            -- DECOMPILER ERROR at PC302: Overwrote pending register: R14 in 'AssignReg'

            do
              if not l_0_5 or not "|REMOTE" then
                local l_0_34, l_0_35 = , l_0_13 >= 2 and 4 > l_0_33 or ""
              end
              local l_0_36 = nil
              local l_0_37 = nil
              local l_0_38 = set_research_data
              local l_0_39 = "ClickFixRDia_SC"
              local l_0_40 = "MED"
              local l_0_41 = tostring(l_0_33)
              local l_0_42 = l_0_37
              local l_0_43 = "||T"
              -- DECOMPILER ERROR at PC321: Overwrote pending register: R24 in 'AssignReg'

              local l_0_44 = l_0_13
              do
                do
                  -- DECOMPILER ERROR at PC327: Overwrote pending register: R26 in 'AssignReg'

                  -- DECOMPILER ERROR at PC328: Overwrote pending register: R27 in 'AssignReg'

                  l_0_38(l_0_39, l_0_40, l_0_41)
                  -- DECOMPILER ERROR at PC334: Overwrote pending register: R16 in 'AssignReg'

                  do return l_0_38 end
                  do return mp.CLEAN end
                  -- DECOMPILER ERROR at PC339: freeLocal<0 in 'ReleaseLocals'

                  -- WARNING: undefined locals caused missing assignments!
                end
              end
            end
          end
        end
      end
    end
  end
end

