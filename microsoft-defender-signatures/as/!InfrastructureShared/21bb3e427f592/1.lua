-- Threat: !InfrastructureShared
-- Name: 21bb3e427f592
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = 4
local l_0_1 = 1
local l_0_2
local l_0_3 = {}
local l_0_4
local l_0_5 = mp.SIGATTR_LOG_SZ
for l_0_6 = 1, l_0_5 do
  if sigattr_tail[l_0_6].attribute == 16491 and sigattr_tail[l_0_6].utf8p1 == "GenericRansomware:Type4" and sigattr_tail[l_0_6].utf8p2 ~= nil then
    l_0_2 = safeJsonDeserialize(sigattr_tail[l_0_6].utf8p2)
    if l_0_2 then
      l_0_4 = l_0_2.appended_ext
      break
    end
  end
end
local l_0_7 = 0
local l_0_8 = 0
local l_0_9 = {}
local l_0_10 = {}
if l_0_4 ~= nil then
  for l_0_11 = 1, l_0_5 do
    if sigattr_tail[l_0_11].attribute == 16384 and sigattr_tail[l_0_11].utf8p1 and sigattr_tail[l_0_11].utf8p1:byte(1) ~= 37 then
      local l_0_12 = sigattr_tail[l_0_11].utf8p1:lower()
      local l_0_13 = l_0_12:match("[^\\]+$")
      local l_0_14 = l_0_13:match("%.[^%.]+$")
      if l_0_14 and l_0_14 == l_0_4 and l_0_3[l_0_12] == nil then
        local l_0_15 = string.sub(l_0_13, 1, string.len(l_0_13) - string.len(l_0_14))
        local l_0_16 = l_0_15:match("%.[^%.]+$")
        if l_0_16 and l_0_10[l_0_16] == nil and mp.GetExtensionClass(l_0_14) == 0 and (mp.GetExtensionClass(l_0_16) == 255 or mp.GetExtensionClass(l_0_16) == 2 or mp.GetExtensionClass(l_0_16) == 3) then
          l_0_10[l_0_16] = l_0_11
          l_0_8 = l_0_8 + 1
        end
        local l_0_17 = l_0_12:match("^(.+)\\")
        if l_0_17 and l_0_9[l_0_17] == nil then
          l_0_9[l_0_17] = l_0_11
          l_0_7 = l_0_7 + 1
        end
        if l_0_0 <= l_0_8 and l_0_1 <= l_0_7 then
          local l_0_18 = {}
          local l_0_19 = {}
          for l_0_20, l_0_21 in pairs(l_0_10) do
            table.insert(l_0_18, l_0_20)
          end
          for l_0_22, l_0_23 in pairs(l_0_9) do
            table.insert(l_0_19, l_0_22)
          end
          local l_0_24 = {
            ext_list = l_0_18,
            dir_list = l_0_19,
            enc_meta = l_0_2
          }
          local l_0_25 = safeJsonSerialize(l_0_24)
          bm.add_related_string("gendfc_ransom_meta", l_0_25, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
        l_0_3[l_0_12] = l_0_11
      end
    end
  end
end
return mp.CLEAN
