-- Threat: !InfrastructureShared
-- Name: 7b78e17e2564
-- Type: 21

local function l_0_0(l_1_0)
  local l_1_1 = {}
  
  for l_1_2 = 1, #l_1_0, 2 do
    l_1_1[#l_1_1 + 1] = tonumber(l_1_0:sub(l_1_2, l_1_2 + 1), 16)
  end
  return l_1_1
end

local function l_0_1(l_2_0, l_2_1, l_2_2, l_2_3)
  local l_2_4 = l_0_0(l_2_1)
  local l_2_5 = {}
  local l_2_6 = #l_2_4
  for l_2_7 = 1, #l_2_0 do
    l_2_5[l_2_7] = mp.bitxor(string.byte(l_2_0, l_2_7), l_2_4[(l_2_7 + l_2_2 - 1) % l_2_6 + 1])
    if l_2_3 < l_2_7 then
      break
    end
  end
  return l_2_5
end

local function l_0_2(l_3_0)
  return tonumber(l_3_0:reverse():gsub(".", function(l_4_0)
    return string.format("%02x", string.byte(l_4_0))
  end), 16)
end

local function l_0_3(l_5_0)
  local l_5_1 = ""
  for l_5_2 = 1, #l_5_0 do
    local l_5_3 = l_5_0[l_5_2]
    if l_5_3 < 36 or 126 < l_5_3 then
      l_5_3 = "|"
    else
      l_5_3 = string.char(l_5_3)
    end
    l_5_1 = l_5_1 .. l_5_3
  end
  return l_5_1
end

local l_0_4 = 627024
local l_0_5 = 2000
local l_0_6 = false
if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA == 0 then
  return mp.CLEAN
end
local l_0_7 = pe.foffset_rva(pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA)
local l_0_8 = l_0_7
while true do
  local l_0_9 = false
  l_0_8 = l_0_8 + 20
  mp.readprotection(false)
  local l_0_10 = l_0_2(mp.readfile(l_0_8, 4))
  if mp.bitand(l_0_10, 4278190080) ~= 2147483648 then
    l_0_9 = true
  end
  l_0_10 = mp.bitand(l_0_10, 16777215)
  l_0_8 = l_0_7 + l_0_10
  if l_0_9 then
    local l_0_11 = pe.foffset_rva(l_0_2(mp.readfile(l_0_8, 4)))
    local l_0_12 = mp.readfile(l_0_11 + l_0_4, l_0_5)
    local l_0_13 = l_0_1(l_0_12, "2aeb18b4d32e076a133132de579218a4c9e3bbdc4d18370cf7664754169ed82d7c6e839a6c28e2e7600b87e34f5e97a68272406985a916a34fec0e495f93821f756bb7bfde512d2c926786cb4740bec4c5022f84f093060457717104e1a80b94d2be43d174f41f7cb416ba87c45ff45080367cfa04dc53bfdc34717ec13f9cc4", l_0_4, l_0_5)
    local l_0_14 = l_0_3(l_0_13)
    if l_0_14:find("GetUserGeoID", 1, true) then
      mp.set_mpattribute("HSTR:IntentToGetUserGeoID")
      l_0_6 = true
    end
    if l_0_14:find("GetGeoInfoW", 1, true) then
      mp.set_mpattribute("HSTR:IntentToGetGeoInfoW")
      l_0_6 = l_0_6 and true
    end
    break
  end
end
mp.readprotection(true)
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
