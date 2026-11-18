-- Threat: !InfrastructureShared
-- Name: 159b3fe422e8d
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = "|.js|jse|vbs|vbe|"
local l_0_3 = {
  SPAWNING_SCRIPT = 1,
  COLORCPL_ABUSE = 2,
  BITSADMIN_HTTP = 3
}
local l_0_4 = {}
l_0_4[l_0_3.SPAWNING_SCRIPT] = function()
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p2
    local l_1_0 = mp.GetExecutablesFromCommandLine(l_0_1)
    for l_1_1, l_1_2 in ipairs(l_1_0) do
      if sysio.IsFileExists(l_1_2) then
        local l_1_3 = string.lower(string.sub(l_1_2, -3))
        if string.find(l_0_2, l_1_3, 1, true) then
          return l_0_3.COLORCPL_ABUSE
        end
      end
    end
  else
    return mp.CLEAN
  end
end
l_0_4[l_0_3.COLORCPL_ABUSE] = function()
  if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil or this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
    return l_0_3.BITSADMIN_HTTP
  else
    return mp.CLEAN
  end
end
l_0_4[l_0_3.BITSADMIN_HTTP] = function()
  if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
    l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
    
    local function l_3_0(l_4_0)
      local l_4_1 = {}
      for l_4_2 in string.gmatch(l_4_0, "http[s]?://[^\"%s]+") do
        table.insert(l_4_1, l_4_2)
      end
      return l_4_1
    end
    
    if l_0_0 ~= nil and string.find(l_0_0, "bitsadmin", 1, true) then
      local l_3_1 = l_3_0(l_0_0)
      local l_3_2 = {}
      l_3_2.SIG_CONTEXT = "BM"
      l_3_2.CONTENT_SOURCE = "COLORCPL_BITSADMIN_WSCRIPT"
      l_3_2.PROCESS_CONTEXT = "bitsadmin.exe"
      l_3_2.FILELESS = "true"
      l_3_2.CMDLINE_URL = "true"
      for l_3_3, l_3_4 in ipairs(l_3_1) do
        if string.match(l_3_4, "^https?://") then
          local l_3_5 = SafeGetUrlReputation({l_3_4}, l_3_2, false, 3000)
          if l_3_5.urls[l_3_4] and l_3_5.urls[l_3_4].determination ~= 1 and l_3_5.urls[l_3_4].confidence ~= 90 then
            return mp.INFECTED
          end
        end
      end
    end
  else
    return mp.CLEAN
  end
end
local l_0_5 = l_0_3.SPAWNING_SCRIPT
while true do
  local l_0_6 = l_0_4[l_0_5]()
  if l_0_6 == mp.CLEAN or l_0_6 == mp.INFECTED then
    break
  end
  l_0_5 = l_0_6
end
return mp.CLEAN
