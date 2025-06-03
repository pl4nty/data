-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFilenameHasUnicodeStyleCharA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 20 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\240", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = {}
l_0_2.name = "Bold"
l_0_2.upper_start = 119808
l_0_2.lower_start = 119834
local l_0_3 = {}
l_0_3.name = "Italic"
l_0_3.upper_start = 119860
l_0_3.lower_start = 119886
local l_0_4 = {}
l_0_4.name = "BoldItalic"
l_0_4.upper_start = 119912
l_0_4.lower_start = 119938
local l_0_5 = {}
l_0_5.name = "Script"
l_0_5.upper_start = 119964
l_0_5.lower_start = 119990
local l_0_6 = {}
l_0_6.name = "Fraktur"
l_0_6.upper_start = 120068
l_0_6.lower_start = 120094
local l_0_7 = {}
l_0_7.name = "DoubleStruck"
l_0_7.upper_start = 120120
l_0_7.lower_start = 120146
local l_0_8 = {}
l_0_8.name = "SansSerif"
l_0_8.upper_start = 120224
l_0_8.lower_start = 120250
local l_0_9 = {}
l_0_9.name = "SansSerifBold"
l_0_9.upper_start = 120276
l_0_9.lower_start = 120302
local l_0_10 = {}
l_0_10.name = "SansSerifItalic"
l_0_10.upper_start = 120328
l_0_10.lower_start = 120354
local l_0_11 = {}
l_0_11.name = "SansSerifBoldItalic"
l_0_11.upper_start = 120380
l_0_11.lower_start = 120406
local l_0_12 = {}
l_0_12.name = "Monospace"
l_0_12.upper_start = 120432
l_0_12.lower_start = 120458
-- DECOMPILER ERROR at PC75: No list found for R1 , SetList fails

l_0_2 = function(l_1_0, l_1_1, l_1_2, l_1_3)
  -- function num : 0_0
  return (l_1_0 - 240) * 262144 + (l_1_1 - 128) * 4096 + (l_1_2 - 128) * 64 + (l_1_3 - 128)
end

l_0_3 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_1
  local l_2_1 = {}
  l_2_1[120064] = "w"
  l_2_1[120065] = "x"
  l_2_1[120066] = "y"
  l_2_1[120067] = "z"
  if l_2_1[l_2_0] then
    return "FrakturAltForm", l_2_1[l_2_0]
  end
  for l_2_5,l_2_6 in ipairs(l_0_1) do
    if l_2_6.upper_start <= l_2_0 and l_2_0 < l_2_6.upper_start + 26 then
      return l_2_6.name, (string.char)(l_2_0 - l_2_6.upper_start + (string.byte)("A"))
    else
      if l_2_6.lower_start <= l_2_0 and l_2_0 < l_2_6.lower_start + 26 then
        return l_2_6.name, (string.char)(l_2_0 - l_2_6.lower_start + (string.byte)("a"))
      end
    end
  end
  return nil, nil
end

l_0_5 = 0
l_0_9 = 1
while 1 do
  while 1 do
    l_0_10 = #l_0_0
    if l_0_9 <= l_0_10 then
      l_0_10, l_0_11 = l_0_0:byte, l_0_0
      l_0_12 = l_0_9
      l_0_10 = l_0_10(l_0_11, l_0_12)
      if l_0_10 == 240 then
        l_0_11 = l_0_9 + 3
        l_0_12 = #l_0_0
        if l_0_11 <= l_0_12 then
          l_0_11, l_0_12 = l_0_0:byte, l_0_0
          l_0_11 = l_0_11(l_0_12, l_0_9 + 1, l_0_9 + 3)
          local l_0_13 = nil
          local l_0_14 = l_0_2(l_0_10, l_0_11, R17_PC106, l_0_13)
          do
            local l_0_15, l_0_16 = l_0_3(l_0_14)
            if l_0_15 and l_0_16 then
              R17_PC106, l_0_4 = l_0_4[l_0_15], {}
              if R17_PC106 == nil then
                l_0_4[l_0_15] = 0
              end
              R17_PC106 = l_0_4[l_0_15]
              R17_PC106 = R17_PC106 + 1
              l_0_4[l_0_15] = R17_PC106
              l_0_5 = l_0_5 + 1
              R17_PC106 = table
              R17_PC106 = R17_PC106.insert
              R17_PC106(l_0_6, l_0_16)
              R17_PC106 = table
              R17_PC106 = R17_PC106.insert
              R17_PC106(l_0_8, l_0_16)
            end
            l_0_9 = l_0_9 + 4
            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC134: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  l_0_11, l_0_12 = l_0_0:sub, l_0_0
  l_0_11 = l_0_11(l_0_12, l_0_9, l_0_9)
  l_0_12 = l_0_12(l_0_11, "[%w]")
  if l_0_12 then
    l_0_12 = table
    l_0_12 = l_0_12.insert
    l_0_12(l_0_8, l_0_11)
  end
  l_0_9 = l_0_9 + 1
end
if l_0_5 >= 1 then
  l_0_10 = 0
  l_0_11 = pairs
  l_0_12 = l_0_4
  l_0_11 = l_0_11(l_0_12)
  for i_1,i_2 in l_0_11 do
    if l_0_19 > 0 then
      l_0_10 = l_0_10 + 1
      -- DECOMPILER ERROR at PC169: Overwrote pending register: R17 in 'AssignReg'

      ;
      (mp.set_mpattribute)(R17_PC106)
      -- DECOMPILER ERROR at PC175: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC178: Overwrote pending register: R17 in 'AssignReg'

      if l_0_19 >= 4 then
        (mp.set_mpattribute)(R17_PC106)
      end
      -- DECOMPILER ERROR at PC184: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC187: Overwrote pending register: R17 in 'AssignReg'

      if l_0_19 >= 8 then
        (mp.set_mpattribute)(R17_PC106)
      end
      -- DECOMPILER ERROR at PC193: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC196: Overwrote pending register: R17 in 'AssignReg'

      if l_0_19 >= 15 then
        (mp.set_mpattribute)(R17_PC106)
      end
      -- DECOMPILER ERROR at PC202: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC205: Overwrote pending register: R17 in 'AssignReg'

      if l_0_19 >= 20 then
        (mp.set_mpattribute)(R17_PC106)
      end
    end
  end
  if l_0_10 >= 1 then
    (mp.set_mpattribute)("Lua:FnameNumberOfUnicodeStyles!" .. tostring(l_0_10))
  end
  if l_0_5 >= 4 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE4")
  end
  if l_0_5 >= 8 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE8")
  end
  if l_0_5 >= 15 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE15")
  end
  if l_0_5 >= 20 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE20")
  end
  local l_0_20 = nil
  -- DECOMPILER ERROR at PC259: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC261: Overwrote pending register: R13 in 'AssignReg'

  if (table.concat)(l_0_6) ~= nil and #(table.concat)(l_0_6) >= 4 then
    (mp.set_mpattribute)(l_0_20)
    -- DECOMPILER ERROR at PC265: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC265: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC274: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "code", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
    -- DECOMPILER ERROR at PC278: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC278: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC287: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "pass", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
    -- DECOMPILER ERROR at PC291: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC291: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC300: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "password", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
    -- DECOMPILER ERROR at PC304: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC304: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC313: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "install", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
    -- DECOMPILER ERROR at PC317: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC317: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC326: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "setup", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
    -- DECOMPILER ERROR at PC330: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC330: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC339: Overwrote pending register: R13 in 'AssignReg'

    if (string.find)(l_0_20, "download", 1, true) ~= nil then
      (mp.set_mpattribute)(l_0_20)
    end
  end
  -- DECOMPILER ERROR at PC343: Overwrote pending register: R13 in 'AssignReg'

  local l_0_21 = nil
  -- DECOMPILER ERROR at PC347: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC350: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC351: Overwrote pending register: R13 in 'AssignReg'

  if (table.concat)(l_0_20) ~= nil and l_0_20 >= 4 then
    l_0_21 = (table.concat)(l_0_20)
    l_0_20 = l_0_20(l_0_21)
    -- DECOMPILER ERROR at PC356: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC359: Overwrote pending register: R14 in 'AssignReg'

    l_0_20(l_0_21)
  end
  -- DECOMPILER ERROR at PC361: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC362: Overwrote pending register: R13 in 'AssignReg'

  return l_0_20
end
do
  l_0_10 = mp
  l_0_10 = l_0_10.CLEAN
  do return l_0_10 end
  -- DECOMPILER ERROR at PC367: Confused about usage of register R12 for local variables in 'ReleaseLocals'

end

