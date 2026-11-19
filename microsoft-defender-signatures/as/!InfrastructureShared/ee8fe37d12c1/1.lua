-- Threat: !InfrastructureShared
-- Name: ee8fe37d12c1
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
local l_0_2 = hstrlog[4].hitcount
local l_0_3 = hstrlog[5].hitcount
local l_0_4 = hstrlog[6].hitcount
local l_0_5 = hstrlog[7].hitcount
local l_0_6 = hstrlog[8].hitcount
local l_0_7 = hstrlog[9].hitcount
local l_0_8 = hstrlog[10].hitcount
local l_0_9 = hstrlog[11].hitcount
local l_0_10 = hstrlog[12].hitcount
local l_0_11 = hstrlog[13].hitcount
local l_0_12 = hstrlog[14].hitcount
local l_0_13 = hstrlog[15].hitcount
local l_0_14 = hstrlog[16].hitcount
local l_0_15 = hstrlog[17].hitcount
local l_0_16 = hstrlog[18].hitcount
local l_0_17 = hstrlog[19].hitcount
local l_0_18 = hstrlog[20].hitcount
local l_0_19 = hstrlog[21].hitcount
local l_0_20 = {
  l_0_0,
  l_0_1,
  l_0_2,
  l_0_3,
  l_0_4,
  l_0_5,
  l_0_6,
  l_0_7,
  l_0_8,
  l_0_9,
  l_0_10,
  l_0_11,
  l_0_12,
  l_0_13,
  l_0_14,
  l_0_15
}
local l_0_21 = {}
for l_0_22 = 1, #l_0_20 do
  if 30 <= l_0_20[l_0_22] then
    table.insert(l_0_21, l_0_20[l_0_22])
  end
end
if 3 <= #l_0_21 then
  local l_0_23 = 0
  for l_0_24 = 1, #l_0_21 do
    local l_0_25 = l_0_21[l_0_24]
    for l_0_26 = l_0_24 + 1, #l_0_21 do
      if l_0_25 == l_0_21[l_0_26] then
        l_0_23 = l_0_23 + 1
      end
    end
  end
  if 1 <= l_0_23 then
    mp.set_mpattribute("MHSTR:PossiblyObfuscatedString.A")
  end
end
if 40 <= l_0_0 and 40 <= l_0_1 and 40 <= l_0_2 and 40 <= l_0_3 and l_0_0 == l_0_1 and l_0_0 == l_0_2 and l_0_0 == l_0_3 or 40 <= l_0_2 and 40 <= l_0_5 and 80 <= l_0_3 and 80 <= l_0_4 and l_0_2 == l_0_5 and l_0_3 == l_0_4 or 30 <= l_0_6 and 30 <= l_0_7 and 30 <= l_0_8 and 30 <= l_0_9 and l_0_6 == l_0_7 and l_0_6 == l_0_8 and l_0_6 == l_0_9 or 30 <= l_0_3 and 30 <= l_0_10 and 30 <= l_0_11 and 30 <= l_0_12 and 60 <= l_0_0 and l_0_3 == l_0_10 and l_0_3 == l_0_11 and l_0_3 == l_0_12 or 30 <= l_0_3 and 30 <= l_0_1 and 30 <= l_0_11 and 30 <= l_0_12 and l_0_3 == l_0_1 and l_0_3 == l_0_11 and l_0_3 == l_0_12 or 80 <= l_0_6 and 80 <= l_0_11 and 40 <= l_0_13 and 100 <= l_0_8 and l_0_6 == l_0_11 or 40 <= l_0_9 and 40 <= l_0_14 and 40 <= l_0_15 and 80 <= l_0_2 and l_0_9 == l_0_14 and l_0_9 == l_0_15 and l_0_16 == 1 then
  mp.set_mpattribute("MHSTR:PossiblyObfuscatedStringForExecution.A")
end
if 150 <= l_0_17 and 4 <= l_0_18 and l_0_18 == l_0_19 + 1 then
  mp.set_mpattribute("MHSTR:PossiblyObfuscatedString.B")
end
return mp.CLEAN
