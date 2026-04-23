-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixRDiaSC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 == 0 or l_0_0 > 512 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
if #l_0_1 > 512 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = false
local l_0_4 = nil
local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_5 and type(l_0_6) == "string" and #l_0_6 > 0 then
  l_0_4 = l_0_6
  local l_0_7 = (string.lower)(l_0_6)
  if (string.sub)(l_0_7, 1, 7) == "http://" or (string.sub)(l_0_7, 1, 8) == "https://" then
    l_0_3 = true
  end
end
do
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC98: No list found for R7 , SetList fails

  local l_0_9 = {}
  -- DECOMPILER ERROR at PC100: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: No list found for R8 , SetList fails

  local l_0_10 = {}
  -- DECOMPILER ERROR at PC115: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R10 in 'AssignReg'

  local l_0_11 = "regsvr32"
  -- DECOMPILER ERROR at PC123: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC137: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R10 in 'AssignReg'

  if ((not ("regsvr32.exe")("certutil", "certutil.exe") or contains(l_0_2, l_0_9)) and not contains(l_0_2, l_0_10)) or l_0_11 == 0 then
    return mp.CLEAN
  end
  local l_0_12 = {}
  -- DECOMPILER ERROR at PC154: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC193: No list found for R11 , SetList fails

  -- DECOMPILER ERROR at PC194: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: Overwrote pending register: R14 in 'AssignReg'

  do
    if not l_0_3 or not "|REMOTE" then
      local l_0_13, l_0_14 = not ("invoke-expression")(" iex ", "bitsadmin") or ""
    end
    local l_0_15 = nil
    local l_0_16 = set_research_data
    -- DECOMPILER ERROR at PC208: Overwrote pending register: R15 in 'AssignReg'

    local l_0_17 = "ClickFixRDia_SC"
    -- DECOMPILER ERROR at PC209: Overwrote pending register: R16 in 'AssignReg'

    local l_0_18 = "bitsadmin.exe"
    -- DECOMPILER ERROR at PC210: Overwrote pending register: R17 in 'AssignReg'

    local l_0_19 = "curl.exe"
    -- DECOMPILER ERROR at PC211: Overwrote pending register: R18 in 'AssignReg'

    local l_0_20 = "wmic"
    -- DECOMPILER ERROR at PC212: Overwrote pending register: R19 in 'AssignReg'

    local l_0_21 = "wmic.exe"
    -- DECOMPILER ERROR at PC213: Overwrote pending register: R20 in 'AssignReg'

    local l_0_22 = "installutil"
    do
      -- DECOMPILER ERROR at PC219: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC220: Overwrote pending register: R23 in 'AssignReg'

      l_0_16(l_0_17, l_0_18, l_0_19)
      -- DECOMPILER ERROR at PC226: Overwrote pending register: R13 in 'AssignReg'

      do return l_0_16 end
      local l_0_24 = nil
      -- DECOMPILER ERROR at PC229: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC231: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC232: Overwrote pending register: R16 in 'AssignReg'

      local l_0_25 = {l_0_16, "-noninteractive", l_0_18, l_0_19, "-wi h", "-wi 1", "-executionpolicy", "-useb", "-usebasicparsing", "start-process"}
      for l_0_29,l_0_30 in ipairs(l_0_25) do
        local l_0_26 = 0
        -- DECOMPILER ERROR at PC248: Confused about usage of register: R18 in 'UnsetPending'

      end
      do
        -- DECOMPILER ERROR at PC289: Unhandled construct in 'MakeBoolean' P3

        if ((not (string.find)(l_0_2, "-wi 1", 1, true) or not (string.find)(l_0_2, "http://", 1, true)) and not (string.find)(l_0_2, "ftp://", 1, true)) or l_0_3 then
          local l_0_31 = l_0_26 + 1 + 2
          -- DECOMPILER ERROR at PC291: Overwrote pending register: R14 in 'AssignReg'

          do
            if not l_0_3 or not "|REMOTE" then
              local l_0_32, l_0_33 = , l_0_11 >= 2 and 4 > l_0_31 or ""
            end
            local l_0_34 = nil
            local l_0_35 = nil
            local l_0_36 = set_research_data
            local l_0_37 = "ClickFixRDia_SC"
            local l_0_38 = "MED"
            local l_0_39 = tostring(l_0_31)
            local l_0_40 = l_0_35
            local l_0_41 = "||T"
            -- DECOMPILER ERROR at PC310: Overwrote pending register: R24 in 'AssignReg'

            local l_0_42 = l_0_11
            do
              do
                -- DECOMPILER ERROR at PC316: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC317: Overwrote pending register: R27 in 'AssignReg'

                l_0_36(l_0_37, l_0_38, l_0_39)
                -- DECOMPILER ERROR at PC323: Overwrote pending register: R16 in 'AssignReg'

                do return l_0_36 end
                do return mp.CLEAN end
                -- DECOMPILER ERROR at PC328: freeLocal<0 in 'ReleaseLocals'

                -- WARNING: undefined locals caused missing assignments!
              end
            end
          end
        end
      end
    end
  end
end

