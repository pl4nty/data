-- Threat: !InfrastructureShared
-- Name: 5141990413c5
-- Type: 21
-- Includes: LuaFuncHelper

if nri.GetHttpCommand() ~= nri.HTTP_GET then
  return mp.CLEAN
end
local l_0_0 = nri.GetURI()
if type(l_0_0) ~= "string" or 65536 < #l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "%?([^#]*)")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match("&" .. l_0_1, "&annotation=([^&]*)")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.gsub(l_0_2, "%%(%x%x)", function(l_1_0)
  return string.char(tonumber(l_1_0, 16))
end)
if #l_0_2 % 4 ~= 0 then
  return mp.CLEAN
end
if not string.match(l_0_2, "^[A-Za-z0-9+/]+=?=?$") then
  return mp.CLEAN
end
local l_0_3 = MpCommon.Base64Decode(l_0_2)
if type(l_0_3) ~= "string" or 49152 < #l_0_3 then
  return mp.CLEAN
end

local function l_0_4(l_2_0)
  if type(l_2_0) ~= "string" or 8 < #l_2_0 then
    return nil
  end
  if not string.match(l_2_0, "^%x+$") then
    return nil
  end
  return tonumber(l_2_0, 16)
end

local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = 0
for l_0_10 in string.gmatch(l_0_3, [[
[^
]+]]) do
  l_0_9 = l_0_9 + 1
  if 64 < l_0_9 then
    return mp.CLEAN
  end
  local l_0_11, l_0_12 = string.match(l_0_10, "^(.-):%s*(.-)%s*$")
  if l_0_11 ~= nil then
    local l_0_13 = string.sub(l_0_12, 1, 1)
    local l_0_14 = l_0_4(l_0_11)
    local l_0_16 = l_0_9 == 1 and l_0_13 == "[" and l_0_14 == nil
    if (l_0_13 == "[" or l_0_13 == "{") and (l_0_14 ~= nil or l_0_16) then
      local l_0_17 = safeJsonDeserialize(l_0_12)
      if type(l_0_17) == "table" then
        if l_0_14 ~= nil then
          if l_0_8[l_0_14] then
            return mp.CLEAN
          end
          l_0_8[l_0_14] = true
        end
        if l_0_13 == "[" then
          l_0_5[#l_0_5 + 1] = {
            id = l_0_14,
            header = l_0_11,
            values = l_0_17
          }
        else
          local l_0_18
          if type(l_0_17.bound) == "string" then
            l_0_18 = l_0_4(string.match(l_0_17.bound, "^%$@(%x+)$"))
          end
          if type(l_0_17.id) == "string" and #l_0_17.id >= 40 and 64 >= #l_0_17.id and string.match(l_0_17.id, "^%x+$") and l_0_18 ~= nil then
            l_0_6[l_0_14] = l_0_18
          end
          if type(l_0_17["then"]) == "string" then
            local l_0_19 = l_0_4(string.match(l_0_17["then"], "^%$h(%x+)$"))
            if l_0_19 ~= nil then
              l_0_7[l_0_14] = l_0_19
            end
          end
        end
      end
    end
  end
end
local l_0_20
for l_0_21, l_0_22 in pairs(l_0_7) do
  local l_0_23 = l_0_6[l_0_22]
  if l_0_23 ~= nil and l_0_21 ~= l_0_22 and l_0_23 ~= l_0_22 and l_0_23 ~= l_0_21 then
    for l_0_24, l_0_25 in ipairs(l_0_5) do
      local l_0_27 = l_0_25.id == l_0_23
      if l_0_25.id == nil then
        local l_0_28 = string.sub(l_0_25.header, -8)
        for l_0_29 = 1, #l_0_28 do
          if l_0_4(string.sub(l_0_28, l_0_29)) == l_0_23 then
            l_0_27 = true
          end
        end
      end
      if l_0_27 and l_0_20 == nil then
        l_0_20 = l_0_25.values
      end
    end
  end
end
if l_0_20 == nil then
  return mp.CLEAN
end
local l_0_30 = "none"
local l_0_31 = {
  "/bin/sh",
  "/bin/bash",
  "cmd.exe",
  "powershell",
  "curl",
  "wget",
  "invoke-webrequest",
  "invoke-restmethod"
}
for l_0_32, l_0_33 in ipairs(l_0_20) do
  if type(l_0_33) == "string" then
    local l_0_34 = string.lower(l_0_33)
    for l_0_35, l_0_36 in ipairs(l_0_31) do
      if string.find(l_0_34, l_0_36, 1, true) then
        l_0_30 = "shell_or_download"
      end
    end
  end
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {argument_hint = l_0_30})
return mp.INFECTED
