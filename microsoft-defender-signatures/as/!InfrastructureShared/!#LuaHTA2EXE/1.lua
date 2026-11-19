-- Threat: !InfrastructureShared
-- Name: !#Lua:HTA2EXE
-- Type: 10
-- MpAttributes: HSTR:HtaEdit.A

local function l_0_0()
  for l_1_0 = 1, pehdr.NumberOfSections do
    if tostring(pesecs[l_1_0].Name) == ".rsrc" then
      return pesecs[l_1_0].PointerToRawData, pesecs[l_1_0].VirtualAddress
    end
  end
end

local function l_0_1(l_2_0)
  local l_2_1 = mp.readfile(l_2_0, 20)
  local l_2_2 = mp.readu_u16(l_2_1, 15)
  local l_2_3 = l_2_0 + 16
  return l_2_2, l_2_3
end

local function l_0_2(l_3_0)
  local l_3_1 = mp.readfile(l_3_0, 8)
  local l_3_2 = mp.readu_u32(l_3_1, 1)
  local l_3_3 = mp.readu_u32(l_3_1, 5)
  local l_3_4 = mp.bitand(l_3_2, 2147483647)
  local l_3_5 = mp.bitand(l_3_2, 4294901760)
  local l_3_6 = mp.bitand(l_3_2, 65535)
  local l_3_7 = mp.shr32(mp.bitand(l_3_3, 2147483648), 31)
  local l_3_8 = mp.bitand(l_3_3, 2147483647)
  return l_3_2, l_3_3, l_3_4, l_3_5, l_3_6, l_3_7, l_3_8
end

local function l_0_3(l_4_0)
  local l_4_1 = mp.readfile(l_4_0, 20)
  local l_4_2 = mp.readu_u32(l_4_1, 1)
  local l_4_3 = mp.readu_u32(l_4_1, 5)
  local l_4_4 = mp.readu_u32(l_4_1, 9)
  local l_4_5 = mp.readu_u32(l_4_1, 13)
  return l_4_2, l_4_3, l_4_4, l_4_5
end

mp.readprotection(false)
local l_0_4, l_0_5 = l_0_0()
local l_0_6, l_0_7 = l_0_1(l_0_4)
for l_0_8 = 0, l_0_6 do
  local l_0_9 = l_0_7 + l_0_8 * 8
  local l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16 = l_0_2(l_0_9)
  if l_0_14 == 23 then
    local l_0_17 = l_0_4 + l_0_16
    local l_0_18, l_0_19 = l_0_1(l_0_17)
    for l_0_20 = 0, l_0_18 do
      local l_0_21 = l_0_19 + l_0_20 * 8
      local l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28 = l_0_2(l_0_21)
      local l_0_29 = l_0_4 + l_0_28
      local l_0_30, l_0_31 = l_0_1(l_0_29)
      for l_0_32 = 0, l_0_30 do
        local l_0_33 = l_0_31 + l_0_32 * 8
        local l_0_34, l_0_35, l_0_36, l_0_37, l_0_38, l_0_39, l_0_40 = l_0_2(l_0_33)
        local l_0_41 = l_0_4 + l_0_40
        local l_0_42, l_0_43 = l_0_3(l_0_41)
        if l_0_43 <= 20000 and l_0_5 < l_0_42 then
          local l_0_44 = l_0_42 - l_0_5 + l_0_4
          local l_0_45 = mp.readfile(l_0_44, l_0_43)
          if mp.readu_u32(l_0_45, 1) == 4290969856 then
            mp.set_mpattribute("//Lua:HTA2EXE_EmbeddedHTA")
            local l_0_46 = string.gsub(l_0_45, "(..)", function(l_5_0)
              return string.char(mp.bitxor(string.byte(l_5_0), 255))
            end)
            mp.vfo_add_buffer(l_0_46, "EmbeddedHTA", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
            return mp.CLEAN
          end
        end
      end
    end
  end
end
return mp.CLEAN
