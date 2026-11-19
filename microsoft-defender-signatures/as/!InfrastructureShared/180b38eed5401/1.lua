-- Threat: !InfrastructureShared
-- Name: 180b38eed5401
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
for l_0_3 = 1, l_0_0 do
  local l_0_4 = sigattr_tail[l_0_3].utf8p2
  if sigattr_tail[l_0_3].attribute == 16491 and l_0_4:find("filetype:unknown", 1, true) then
    local l_0_5 = {}
    for l_0_6, l_0_7 in string.gmatch(l_0_4, "(%w+):([^;]*)") do
      l_0_5[l_0_6] = l_0_7
    end
    if tonumber(l_0_5.entropy) >= 6 and l_0_5.filepath then
      local l_0_8 = l_0_5.filepath:lower()
      if l_0_1[l_0_8] == nil then
        l_0_1[l_0_8] = l_0_3
        local l_0_9 = l_0_8:match("%.[^%.]+$")
        if l_0_9 and mp.GetExtensionClass(l_0_9) == 0 then
          if l_0_2[l_0_9] ~= nil then
            table.insert(l_0_2[l_0_9], l_0_8)
          else
            l_0_2[l_0_9] = {l_0_8}
          end
        end
      end
    end
  end
end
local l_0_10 = {}
for l_0_11, l_0_12 in pairs(l_0_2) do
  if 10 <= #l_0_12 then
    for l_0_13, l_0_14 in pairs(l_0_12) do
      table.insert(l_0_10, l_0_14)
    end
  end
end
if 10 <= #l_0_10 then
  local l_0_15 = {
    count = #l_0_10,
    file_list = l_0_10
  }
  bm.trigger_sig("GenericRansomware:HighEntropyUnkFileMeta", safeJsonSerialize(l_0_15))
  return mp.INFECTED
end
return mp.CLEAN
