-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6241e96a04da\1.luac 

-- params : ...
-- function num : 0
if (nri.GetHttpCommand)() ~= nri.HTTP_GET then
  return mp.CLEAN
end
local l_0_0 = (nri.GetURI)()
if type(l_0_0) ~= "string" or #l_0_0 > 65536 then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "%?([^#]*)")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.match)("&" .. l_0_1, "&annotation=([^&]*)")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.gsub)(l_0_2, "%%(%x%x)", function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.char
  do
    local l_1_2, l_1_3, l_1_4 = tonumber(l_1_0, 16), .end
    do return l_1_1(l_1_2, l_1_3, l_1_4) end
    -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end
)
if #l_0_2 % 4 ~= 0 then
  return mp.CLEAN
end
if not (string.match)(l_0_2, "^[A-Za-z0-9+/]+=?=?$") then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.Base64Decode)(l_0_2)
if type(l_0_3) ~= "string" or #l_0_3 > 49152 then
  return mp.CLEAN
end
local l_0_4 = function(l_2_0)
  -- function num : 0_1
  if type(l_2_0) ~= "string" or #l_2_0 > 8 then
    return nil
  end
  if not (string.match)(l_2_0, "^%x+$") then
    return nil
  end
  local l_2_1 = tonumber
  local l_2_2 = l_2_0
  do
    local l_2_3 = 16
    do return l_2_1(l_2_2, l_2_3) end
    -- DECOMPILER ERROR at PC24: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = 0
for l_0_13 in (string.gmatch)(l_0_3, "[^\n]+") do
  l_0_9 = l_0_9 + 1
  if l_0_9 > 64 then
    return mp.CLEAN
  end
  local l_0_14, l_0_15 = (string.match)(l_0_13, "^(.-):%s*(.-)%s*$")
  if l_0_14 ~= nil then
    local l_0_16 = (string.sub)(l_0_15, 1, 1)
    local l_0_17 = l_0_4(l_0_14)
    if (l_0_16 == "[" or l_0_16 == "{") and (l_0_17 ~= nil or l_0_9 == 1 and l_0_16 == "[" and l_0_17 == nil) then
      local l_0_21 = nil
      if type(safeJsonDeserialize(l_0_15)) == "table" then
        if l_0_17 ~= nil then
          if l_0_8[l_0_17] then
            return mp.CLEAN
          end
          l_0_8[l_0_17] = true
        end
        if l_0_16 == "[" then
          local l_0_22 = nil
          local l_0_23 = #l_0_5 + 1
          l_0_5[l_0_23] = {id = l_0_17, header = l_0_14, values = l_0_22}
        else
          local l_0_24 = nil
          -- DECOMPILER ERROR at PC177: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC200: Confused about usage of register: R20 in 'UnsetPending'

          if (type(l_0_24.bound) ~= "string" or type(l_0_24.id) == "string") and #l_0_24.id >= 40 and #l_0_24.id <= 64 and (string.match)(l_0_24.id, "^%x+$") and nil ~= nil then
            l_0_6[l_0_17] = nil
          end
          if type(l_0_24["then"]) == "string" then
            local l_0_25 = nil
            if l_0_4((string.match)(l_0_24["then"], "^%$h(%x+)$")) ~= nil then
              l_0_7[l_0_17] = l_0_4((string.match)(l_0_24["then"], "^%$h(%x+)$"))
            end
          end
        end
      end
    end
  end
end
local l_0_26 = nil
for l_0_30,l_0_31 in pairs(l_0_7) do
  local l_0_32 = l_0_6[l_0_31]
  if l_0_32 ~= nil and l_0_30 ~= l_0_31 and l_0_32 ~= l_0_31 and l_0_32 ~= l_0_30 then
    for l_0_36,l_0_37 in ipairs(l_0_5) do
      if l_0_37.id == nil then
        local l_0_40 = l_0_37.id == l_0_32
        for l_0_44 = 1, #(string.sub)(l_0_37.header, -8) do
          local l_0_41 = nil
          -- DECOMPILER ERROR at PC257: Confused about usage of register: R27 in 'UnsetPending'

          if l_0_4((string.sub)(l_0_41, R27_PC257)) == l_0_32 then
            l_0_40 = true
          end
        end
      end
      -- DECOMPILER ERROR at PC264: Confused about usage of register: R22 in 'UnsetPending'

      if l_0_40 and l_0_26 == nil then
        l_0_26 = l_0_37.values
      end
    end
  end
end
if l_0_26 == nil then
  return mp.CLEAN
end
local l_0_46 = nil
local l_0_47 = nil
-- DECOMPILER ERROR at PC289: Overwrote pending register: R13 in 'AssignReg'

for l_0_51,l_0_52 in l_0_47 do
  local l_0_52 = nil
  -- DECOMPILER ERROR at PC298: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC299: Overwrote pending register: R18 in 'AssignReg'

  if l_0_52 == "string" then
    local l_0_53 = nil
    for l_0_57,l_0_58 in l_0_53 do
      local l_0_58 = nil
      -- DECOMPILER ERROR at PC307: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC315: Overwrote pending register: R11 in 'AssignReg'

    end
  end
end
-- DECOMPILER ERROR at PC320: Overwrote pending register: R13 in 'AssignReg'

if l_0_58 then
  local l_0_59 = nil
  local l_0_60 = nil
  do
    local l_0_61 = nil
    ;
    (l_0_47.AddTelemetry)(nri.Telemetry_HOSTNAME, l_0_59)
    l_0_59 = {argument_hint = "none"}
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC330: Confused about usage of register R14 for local variables in 'ReleaseLocals'

    -- DECOMPILER ERROR: 17 unprocessed JMP targets
  end
end

