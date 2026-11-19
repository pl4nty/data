-- Threat: !InfrastructureShared
-- Name: 588b33492d662
-- Type: 21
-- Includes: BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = 0
for l_0_6 = 1, l_0_0 do
  local l_0_7 = sigattr_tail[l_0_6].attribute
  if l_0_7 == 16389 and sigattr_tail[l_0_6].utf8p2 == "ATTR_c09458eb" then
    local l_0_8 = sigattr_tail[l_0_6].utf8p1:lower()
    l_0_4[mp.crc32(0, l_0_8, 1, #l_0_8)] = l_0_6
  end
end
for l_0_9 = 1, l_0_0 do
  if sigattr_tail[l_0_9].attribute == 16385 and sigattr_tail[l_0_9].utf8p2 ~= 0 and sigattr_tail[l_0_9].utf8p2 ~= "" then
    local l_0_10 = sigattr_tail[l_0_9].utf8p1:lower()
    local l_0_11 = sigattr_tail[l_0_9].utf8p2:lower()
    local l_0_12 = {}
    local l_0_13 = mp.crc32(0, l_0_10, 1, #l_0_10)
    if l_0_1[l_0_13] == nil and l_0_4[l_0_13] ~= nil then
      l_0_1[l_0_13] = l_0_9
      for l_0_14, l_0_15 in string.gmatch(l_0_11, "(%w+):(%w+)") do
        l_0_12[l_0_14] = l_0_15
      end
      local l_0_16 = tonumber(l_0_12.firstoff)
      local l_0_17 = tonumber(l_0_12.biggestoff)
      local l_0_18 = tonumber(l_0_12.totalsizewrite)
      local l_0_19 = tonumber(l_0_12.numwrites)
      if l_0_16 ~= nil and l_0_17 ~= nil and l_0_18 ~= nil and l_0_19 ~= nil and l_0_18 == sysio.GetFileSize(l_0_10) then
        local l_0_20 = string.find(l_0_10, "\\[^\\]*$") or 0
        local l_0_21 = string.find(l_0_10, ".", l_0_20, true)
        if l_0_21 ~= nil then
          local l_0_22 = string.sub(l_0_10, l_0_20 + 1, l_0_21 - 1)
          local l_0_23 = l_0_10:match("%.[^%.]+$")
          if l_0_2[l_0_22] == nil or l_0_3[l_0_23] == nil then
            l_0_2[l_0_22] = l_0_9
            l_0_3[l_0_23] = l_0_9
            l_0_5 = l_0_5 + 1
            if 5 <= l_0_5 then
              reportTimingData()
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
